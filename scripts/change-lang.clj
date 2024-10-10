#! /usr/bin/bb
(require
 '[babashka.process :refer [shell]]
 '[clojure.string :as s])

(defn notify [lang]
  (shell (str "notify-send -t 2000 \"Language: " lang "\"")))

(defn split [re str]
  (s/split str re))

(defn current-lang []
  (->> "setxkbmap -query"
       (shell {:out :string})
       :out
       s/split-lines
       last
       (split #":\s+")
       second))

(defn change-lang [lang]
  (shell (str "setxkbmap -layout " lang))
  (notify lang))

(defn switch-lang []
  (case (current-lang)
    "us" (change-lang "lt")
    "lt" (change-lang "us")))

(switch-lang)
