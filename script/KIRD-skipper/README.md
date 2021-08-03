*[출처] [jmkim/KIRD-skipper-20191118.js](https://gist.github.com/jmkim/3ac2a93dded5d172865e58ea4f81313e)*


# [KIRD](https://cyber.kird.re.kr) Skipper 

https://cyber.kird.re.kr skipping (bypassing) script 

KIRD 온라인 교육 스킵 스크립트

![01.png](./src/01.png)

## How to use
1. Run your browser's web debugger (F12).
2. Click "Console".
3. Click "HkmsMainFrame" or "clsrmContentsForm.do" on the target selection.
4. Paste the script on the console prompt.
5. Run it (by pressing Enter or Ctrl-Enter)!
6. Loop it until finish.


## 사용방법
1. 웹 브라우저의 디버거(F12)를 엽니다.
2. "콘솔"을 클릭합니다.
3. 대상 또는 타겟으로 "HkmsMainFrame" 또는 "clsrmContentsForm.do"를 선택합니다.
4. 콘솔 프롬프트에 스크립트를 붙여넣습니다.
5. 스크립트를 실행합니다 (엔터 또는 컨트롤+엔터).
6. 끝날 때 까지 반복하여 스크립트(5.)를 실행합니다.

# CODE 
```javascript
// KIRD skipper, 11-18-2019
// https://cyber.kird.re.kr
//
// This script does: Mark as "Complete" for current stage --> Continue to next stage
// How to use: Run your browser's web debugger (F12) and copy-paste this on its JavaScript console.

if(pageTime == null) { console.log("Please run this script on the target 'HkmcMainFrame (clsrmContentsForm.do)'."); console.log("If you already done it, then unfortunately, this script is not working anymore..."); } else { pageTime = pageTime - 10000000; setBaseTimeCommit(); document.getElementsByClassName("btnNext")[0].onclick(); }

```