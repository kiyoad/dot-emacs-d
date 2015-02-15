;;-*- coding: utf-8 -*-

;; /usr/local/share/emacs/24.4/lisp/leim/quail/japanese.el.gz

;; ローマ字入力及び仮名漢字変換による日本語入力メソッド
;;
;; この入力メソッドでの日本語の入力は二つのステージ「ローマ字仮名変換」
;; と「仮名漢字変換」からなる。最初はローマ字仮名変換のステージで、ス
;; ペースキーを押すことにより、次のステージ「仮名漢字変換」へ進む。
;;
;; 「ローマ字仮名変換」
;;
;; 平仮名は小文字キー（列）を打つことにより入力。句読点、括弧類は対応
;; する英字キーを打つことにより入力。その他のシンボルは `z' に続けて何
;; れかのキーを打つことにより入力。下に全ての可能なキーシーケンスリス
;; トアップされている。入力された文字は下線で示される。
;;
;; さらに以下のキーで特別な処理を行う。
;;
;; K	平仮名を片仮名に、あるいは片仮名を平仮名に変換
;; qq	この入力メソッドと `japanese-ascii' 入力メソッドをトグル切替
;; qz	`japanese-zenkaku' 入力メソッドにシフト
;;	qh と打てば元に戻る
;; RET	現在の入力文字列を確定
;; SPC	仮名漢字変換に進む
;;
;; `japanese-ascii' 入力メソッドは ASCII 文字を入力するのに使う。これ
;; は入力メソッドをオフにするのとほとんど同じである。異なるのは qq と
;; 打つことにより、`japanese' 入力メソッドに戻れる点である。
;;
;; `japanese-zenkaku' 入力メソッドは全角英数字を入力するのに使う。
;;
;; 「ローマ字仮名変換」ステージでのキーシーケンスのリストは最後に付け
;; てある。
;;
;; 「仮名漢字変換」
;;
;; このステージでは、前ステージで入力された文字列を仮名漢字変換する。
;; 変換された文字列は、注目文節（反転表示）と残りの入力（下線表示）に
;; 分けられる。注目文節に対しては以下のコマンドが使える。
;;
;; SPC, C-n	kkc-next
;;	次の変換候補を表示
;;	kkc-show-conversion-list-count 以上続けて打てば、変換候補リス
;;	トをエコーエリアに表示
;; C-p		kkc-prev
;;	前の変換候補を表示
;;	kkc-show-conversion-list-count 以上続けて打てば、変換候補リス
;;	トをエコーエリアに表示
;; l		kkc-show-conversion-list-or-next-group
;;	最高１０個までの変換候補をエコーエリアに表示。
;;	続けて打たれれば、次の１０候補を表示。
;; L		kkc-show-conversion-list-or-prev-group
;;	最高１０個までの変換候補をエコーエリアに表示。
;;	続けて打たれれば、前の１０候補を表示。
;; 0..9		kkc-select-from-list
;;	打たれた数字の変換候補を選択
;; H		kkc-hiragana
;;	注目文節を平仮名に変換
;; K		kkc-katakana
;;	注目文節を片仮名に変換
;; C-o		kkc-longer
;;	注目文節を後ろに一文字伸ばす
;; C-i		kkc-shorter
;;	注目文節を後ろから一文字縮める
;; C-f		kkc-next-phrase
;;	注目文節を確定させる。もし残りの入力がまだあれば、最初の文節を
;;	選択し、それを注目文節とし、その最初の変換候補を表示する。
;; DEL, C-c	kkc-cancel
;;	仮名漢字変換をキャンセルし、ローマ字仮名変換のステージに戻る。
;; return		kkc-terminate
;;	全文節を確定させる。
;; C-SPC, C-@	kkc-first-char-only
;;	最初の文字を確定させ、残りは削除する。
;; C-h		kkc-help
;;	これらのキーバインドのリストを表示する。

(eval-after-load "japanese"
  '(setq quail-japanese-use-double-n t))

(eval-after-load 'quail
  '(progn
     (defadvice quail-define-package (before my-quail-define-package activate)
       (define-key quail-translation-keymap (kbd "C-h") 'quail-delete-last-char)
       (define-key quail-translation-keymap (kbd "C-?") 'quail-translation-help)
       (define-key quail-simple-translation-keymap (kbd "C-h") 'quail-delete-last-char)
       (define-key quail-simple-translation-keymap (kbd "C-?") 'quail-translation-help)
       (define-key quail-conversion-keymap (kbd "C-h") 'quail-conversion-backward-delete-char)
       (define-key quail-conversion-keymap (kbd "C-?") 'quail-translation-help))))

(eval-after-load 'kkc
  '(progn
     (define-key kkc-keymap (kbd "C-a") 'kkc-cancel)
     (define-key kkc-keymap (kbd "C-e") 'kkc-cancel)
     (define-key kkc-keymap (kbd "C-h") 'kkc-cancel)
     (define-key kkc-keymap (kbd "C-?") 'kkc-help)))
