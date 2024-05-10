(require
 '[babashka.process :refer [shell]]
 '[cheshire.core :as json])

(def sinks-to-consider #{"Creative Bluetooth Audio W2" "D50s"})

(defn notify-send [sink]
  (shell (str "notify-send -t 2000 \"Using sink " sink "\"")))

(defn set-sink [system-name]
  (shell (str "pactl set-default-sink " system-name)))

(defn cycle-active-sink []
  (let [sinks-json (-> (shell {:out :string} "pactl --format=\"json\" list sinks")
                       :out
                       (json/parse-string true))
        active-sink (->> sinks-json
                         (filter (fn [state] (= "RUNNING" (:state state))))
                         first
                         :name)
        ;; All sinks we are interested in.
        sink-stack (->> sinks-json
                        (map #(vector (get-in % [:properties :alsa.card_name]) (:name %)))
                        (filter (fn [[nice-name _]] (contains? sinks-to-consider nice-name))))
        ;; Remaining sinks to cycle trough. If empty, we start from the top of the stack.
        remaining-sinks (rest (drop-while (fn [[_ system-name]] (not= system-name active-sink)) sink-stack))
        [nice-name, system-name-to-swap-to] (if (empty? remaining-sinks)
                                              (first sink-stack)
                                              (first remaining-sinks))]

    (notify-send nice-name)
    (set-sink system-name-to-swap-to)))

(cycle-active-sink)
