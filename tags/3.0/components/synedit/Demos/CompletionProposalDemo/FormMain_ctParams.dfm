�
 TFORM1 0E
  TPF0TForm1Form1Left TopzWidth�HeightCaptionForm1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OnCreate
FormCreate	OnDestroyFormDestroyOnShowFormShowPixelsPerInch`
TextHeight TSynEditSynTestLeft�TopWidthAHeight�Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style TabOrder Gutter.Font.CharsetDEFAULT_CHARSETGutter.Font.ColorclWindowTextGutter.Font.Height�Gutter.Font.NameTerminalGutter.Font.Style Gutter.VisibleLines.Strings#This is a Demo to show you how the  Code Completion component works "when the default kind is ctParams.  Everything really depends on the"code you put in the execute event.#This determines what the parametersare and what index should behighlighted. !See the source file execute eventfor more information. RemovedKeystrokesCommandecContextHelpShortCutp  AddedKeystrokesCommandecContextHelpShortCutp@    TSynEditSynEdit1LeftTop`Width�Height�Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style TabOrderGutter.Font.CharsetDEFAULT_CHARSETGutter.Font.ColorclWindowTextGutter.Font.Height�Gutter.Font.NameTerminalGutter.Font.Style Lines.Strings*Use Shift+Ctrl+Space to activate Parameter%completion, or type the function name)and the '(' (open paren) to start it with
the timer. (The valid functions for this example are TestFunctionMinMax )Below is an example using paren Counting:Max(a + b(1 + 2), (3 + 4) * c) 'Here is an example of embeded functions )TestFunction(Min(a, b), SomeVar, Another) RemovedKeystrokesCommandecContextHelpShortCutp  AddedKeystrokesCommandecContextHelpShortCutp@    TButtonButton3LeftTop(WidthKHeightCaptionFontTabOrderOnClickButton3Click  TSynCompletionProposal	scpParamsDefaultTypectParamsOptionsscoLimitToMatchedTextscoUsePrettyTextscoUseBuiltInTimer ClBackgroundclInfoBkWidthEndOfTokenChr()[]. TriggerChars(Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style TitleFont.CharsetDEFAULT_CHARSETTitleFont.Color	clBtnTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.StylefsBold Columns 	OnExecutescpParamsExecuteShortCut `EditorSynEdit1TimerInterval�Left  TFontDialogFontDialog1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style MinFontSize MaxFontSize Left,   