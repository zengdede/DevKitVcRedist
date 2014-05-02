; --------------------------------
; See VcRedist.txt for versions
; --------------------------------
!ifndef	VCREDIST_CONFIG
	!include VcRedist_config.nsh
	!include VcRedist_langstrings.nsh
!endif
!include "x64.nsh"		; Macros for x64 machines

; --------------------------------
;  Calls

	; StrStr
	;!include "StrFunc.nsh"
	;${StrStr}
		
; --------------------------------
;  Version Variables
!ifdef VCREDIST2005
	Var X86_2005
	Var X64_2005
!endif
!ifdef VCREDIST2008
	Var X86_2008
	Var X64_2008
!endif
!ifdef VCREDIST2010
	Var X86_2010
	Var X64_2010
!endif
!ifdef VCREDIST2012
	Var X86_2012
	Var X64_2012
!endif
		
; --------------------------------
;  Internal Variables
	Var	VCREDIST_NAME
	Var	VCREDIST_GUID
	Var	VCREDIST_PATH
	Var	VCREDIST_URL
	Var	VCREDIST_IS64
	Var	VCREDIST_FILE
	Var	VCREDIST_FOUND
	Var	VCREDIST_REBOOT
	Var	VCREDIST_VERSION
	
; ======================================================
;  Reset Counters
; ======================================================
Function "ResetVCRedistCounter"
	;  Reset Variables
!ifdef VCREDIST2005
	IntOp $X86_2005 $X86_2005 ^ $X86_2005
	IntOp $X64_2005 $X64_2005 ^ $X64_2005
!endif
!ifdef VCREDIST2008
	IntOp $X86_2008 $X86_2008 ^ $X86_2008
	IntOp $X64_2008 $X64_2008 ^ $X64_2008
!endif
!ifdef VCREDIST2010
	IntOp $X86_2010 $X86_2010 ^ $X86_2010
	IntOp $X64_2010 $X64_2010 ^ $X64_2010
!endif
!ifdef VCREDIST2012
	IntOp $X86_2012 $X86_2012 ^ $X86_2012
	IntOp $X64_2012 $X64_2012 ^ $X64_2012
!endif
FunctionEnd

; ======================================================
;  Install VCredist
; ======================================================
Function "InstallVCRedist"
!ifdef VCREDIST2005
	${If} $X86_2005> 0
		Call 2005vcredistX86
	${EndIf}
	${If} $X64_2005 > 0
		Call 2005vcredistX64
	${EndIf}
!endif
!ifdef VCREDIST2008
	${If} $X86_2008 > 0
		Call 2008vcredistX86
	${EndIf}
	${If} $X64_2008 > 0
		Call 2008vcredistX64
	${EndIf}
!endif
!ifdef VCREDIST2010
	${If} $X86_2010 > 0
		Call 2010vcredistX86
	${EndIf}
	${If} $X64_2010 > 0
		Call 2010vcredistX64
	${EndIf}
!endif
!ifdef VCREDIST2012
	${If} $X86_2012 > 0
		Call 2012vcredistX86
	${EndIf}
	${If} $X64_2012 > 0
		Call 2012vcredistX64
	${EndIf}
!endif
FunctionEnd

; ======================================================
;  VCREDIST 2005 
; ======================================================
!ifdef VCREDIST2005
Function "2005vcredistX86"
	StrCpy $VCREDIST_NAME	"Visual C++ 2005 SP1 MFC Security Update (x86)"
	StrCpy $VCREDIST_GUID	"{710F4C1C-CC18-4C49-8CBF-51240C89A1A2}"
	StrCpy $VCREDIST_PATH	"vcRedist_2005\x86_SP1_MFC\vcredist_x86.exe"
	StrCpy $VCREDIST_URL	"http://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE"
	StrCpy $VCREDIST_FILE	"vcredist_2005_x86.exe"
	StrCpy $VCREDIST_REBOOT	";3010;8192;1641;1046;"
	StrCpy $VCREDIST_IS64	"0"
	
	Call CheckRedistWithWinSxs
FunctionEnd

Function "2005vcredistX64"
	StrCpy $VCREDIST_NAME	"Visual C++ 2005 SP1 MFC Security Update (x64)"
	StrCpy $VCREDIST_GUID	"{AD8A2FA1-06E7-4B0D-927D-6E54B3D31028}"
	StrCpy $VCREDIST_PATH	"${VCREDIST_ROOT}\vcRedist_2005\x64_SP1_MFC\vcredist_x86.exe"
	StrCpy $VCREDIST_URL	"http://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE"
	StrCpy $VCREDIST_FILE	"vcredist_2005_x64.exe"
	StrCpy $VCREDIST_REBOOT	";3010;8192;1641;1046;"
	StrCpy $VCREDIST_IS64	"1"
	
	Call CheckRedistWithWinSxs
FunctionEnd
!endif

; ======================================================
;  VCREDIST 2008 
; ======================================================
!ifdef VCREDIST2008
Function "2008vcredistX86"
	StrCpy $VCREDIST_NAME	"Visual C++ 2008 SP1 MFC Security Update (x86)"
	StrCpy $VCREDIST_GUID	"{9BE518E6-ECC6-35A9-88E4-87755C07200F}"
	StrCpy $VCREDIST_PATH	"${VCREDIST_ROOT}\vcRedist_2008\x86_SP1_MFC\vcredist_x86.exe"
	StrCpy $VCREDIST_URL	"http://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe"
	StrCpy $VCREDIST_FILE	"vcredist_2008_x86.exe"
	StrCpy $VCREDIST_REBOOT	";3010;8192;1641;1046;"
	StrCpy $VCREDIST_IS64	"0"
	
	Call CheckRedistWithWinSxs
FunctionEnd

Function "2008vcredistX64"
	StrCpy $VCREDIST_NAME	"Visual C++ 2008 SP1 MFC Security Update (x64)"
	StrCpy $VCREDIST_GUID	"{5FCE6D76-F5DC-37AB-B2B8-22AB8CEDB1D4}"
	StrCpy $VCREDIST_PATH	"${VCREDIST_ROOT}\vcRedist_2008\x64_SP1_MFC\vcredist_x64.exe"
	StrCpy $VCREDIST_URL	"http://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe"
	StrCpy $VCREDIST_FILE	"vcredist_2008_x64.exe"
	StrCpy $VCREDIST_REBOOT	";3010;8192;1641;1046;"
	StrCpy $VCREDIST_IS64	"1"
	
	Call CheckRedistWithWinSxs
FunctionEnd
!endif

; ======================================================
;  VCREDIST 2010
; ======================================================
!ifdef VCREDIST2010
Function "2010vcredistX86"
	StrCpy $VCREDIST_NAME	"Visual C++ 2010 SP1 (x86)"
	StrCpy $VCREDIST_GUID	"{F0C3E5D1-1ADE-321E-8167-68EF0DE699A5}"
	StrCpy $VCREDIST_PATH	"${VCREDIST_ROOT}\vcRedist_2010\x86_SP1\vcredist_x86.exe"
	StrCpy $VCREDIST_URL	"http://download.microsoft.com/download/C/6/D/C6D0FD4E-9E53-4897-9B91-836EBA2AACD3/vcredist_x86.exe"
	StrCpy $VCREDIST_FILE	"vcredist_2010_x86.exe"
	StrCpy $VCREDIST_REBOOT	";1641;3010;"
	StrCpy $VCREDIST_IS64	"0"

	;TODO lehet az ujabb jobb lenne
	;Call CheckRedistVC10
	Call CheckRedistWithWinSxs
FunctionEnd

Function "2010vcredistX64"
	StrCpy $VCREDIST_NAME	"Visual C++ 2010 SP1 (x64)"
	StrCpy $VCREDIST_GUID	"{1D8E6291-B0D5-35EC-8441-6616F567A0F7}"
	StrCpy $VCREDIST_PATH	"${VCREDIST_ROOT}\vcRedist_2010\x64_SP1\vcredist_x64.exe"
	StrCpy $VCREDIST_URL	"http://download.microsoft.com/download/A/8/0/A80747C3-41BD-45DF-B505-E9710D2744E0/vcredist_x64.exe"
	StrCpy $VCREDIST_FILE	"vcredist_2010_x64.exe"
	StrCpy $VCREDIST_REBOOT	";1641;3010;"
	StrCpy $VCREDIST_IS64	"1"

	;TODO lehet az ujabb jobb lenne
	;Call CheckRedistVC10
	Call CheckRedistWithWinSxs
FunctionEnd
!endif

; ======================================================
;  VCREDIST 2012
; ======================================================
!ifdef VCREDIST2012
Function "2012vcredistX86"
	StrCpy $VCREDIST_NAME	"Visual C++ 2012 Update 4 (x86)"
	StrCpy $VCREDIST_GUID	"{F0C3E5D1-1ADE-321E-8167-68EF0DE699A5}"
	StrCpy $VCREDIST_PATH	"${VCREDIST_ROOT}\vcRedist_2012\x86_update_4\vcredist_x86.exe"
	StrCpy $VCREDIST_URL	"http://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe"
	StrCpy $VCREDIST_FILE	"vcredist_2012_x86.exe"
	StrCpy $VCREDIST_REBOOT	";1641;3010;"
	StrCpy $VCREDIST_IS64	"0"
	
	IntOp $VCREDIST_VERSION $VCREDIST_VERSION ^ $VCREDIST_VERSION
	IntOp $VCREDIST_VERSION $VCREDIST_VERSION + 61030
	
	Call CheckRedistVC12
FunctionEnd

Function "2012vcredistX64"
	StrCpy $VCREDIST_NAME	"Visual C++ 2012 Update 4 (x64)"
	StrCpy $VCREDIST_GUID	"{F0C3E5D1-1ADE-321E-8167-68EF0DE699A5}"
	StrCpy $VCREDIST_PATH	"${VCREDIST_ROOT}\vcRedist_2012\x64_update_4\vcredist_x86.exe"
	StrCpy $VCREDIST_URL	"http://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
	StrCpy $VCREDIST_FILE	"vcredist_2012_x64.exe"
	StrCpy $VCREDIST_REBOOT	";1641;3010;"
	StrCpy $VCREDIST_IS64	"1"
	
	IntOp $VCREDIST_VERSION $VCREDIST_VERSION ^ $VCREDIST_VERSION
	IntOp $VCREDIST_VERSION $VCREDIST_VERSION + 61030
	
	Call CheckRedistVC12
FunctionEnd
!endif


; ======================================================
;  Check Redist Exist
; ======================================================
Function "CheckRedistWithWinSxs"
	StrCpy $VCREDIST_FOUND	"0"
	StrCpy $R9 $VCREDIST_NAME
	
	${If} $VCREDIST_IS64 == "1"
		SetRegView 64
	${Else}
		SetRegView 32
	${EndIf}
	
	ClearErrors
	ReadRegStr $0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$VCREDIST_GUID" "DisplayName"
	${If} $0 != ""
		StrCpy $VCREDIST_FOUND "1"
	${EndIf}
	
	Call RedistDownloadAndInstall
FunctionEnd

/*
Function "CheckRedistVC10"
	StrCpy $VCREDIST_FOUND	"0"
	StrCpy $R9 $VCREDIST_NAME
	
	${If} $VCREDIST_IS64 == "1"
		${If} ${RunningX64}
			StrCpy $1 "SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\VC\VCRedist\x64"
		${Else}
			StrCpy $1 "SOFTWARE\Microsoft\VisualStudio\10.0\VC\VCRedist\x86"
		${EndIf}
		SetRegView 64
	${Else}
		${If} ${RunningX64}
			StrCpy $1 "SOFTWARE\Wow6432Node\Microsoft\VisualStudio\10.0\VC\VCRedist\x86"
		${Else}
			StrCpy $1 "SOFTWARE\Microsoft\VisualStudio\10.0\VC\VCRedist\x86"
		${EndIf}
		SetRegView 32
	${EndIf}
	
	ClearErrors
	ReadRegStr $0 HKLM $1 "Installed"
	${If} $0 == "1"
		StrCpy $VCREDIST_FOUND "1"
	${EndIf}
	
	Call RedistDownloadAndInstall
FunctionEnd
*/

Function "CheckRedistVC12"
	StrCpy $VCREDIST_FOUND	"0"
	StrCpy $R9 $VCREDIST_NAME
	;StrCpy $1 "SOFTWARE\Microsoft\DevDiv\vc\Servicing\11.0\RuntimeMinimum"
	
	${If} $VCREDIST_IS64 == "1"
		${If} ${RunningX64}
			StrCpy $1 "SOFTWARE\Wow6432Node\Microsoft\VisualStudio\11.0\VC\Runtimes\x64"
		${Else}
			StrCpy $1 "SOFTWARE\\Microsoft\VisualStudio\11.0\VC\Runtimes\x64"
		${EndIf}
		SetRegView 64
	${Else}
		${If} ${RunningX64}
			StrCpy $1 "SOFTWARE\Wow6432Node\Microsoft\VisualStudio\11.0\VC\Runtimes\x86"
		${Else}
			StrCpy $1 "SOFTWARE\\Microsoft\VisualStudio\11.0\VC\Runtimes\x86"
		${EndIf}
		SetRegView 32
	${EndIf}
	
	ClearErrors
	ReadRegStr $0 HKLM $1 "Installed"
	${If} $0 == "1"
		ReadRegDWORD $0 HKLM $1 "Bld"
		${If} $0 >= $VCREDIST_VERSION
			StrCpy $VCREDIST_FOUND "1"
		${EndIf}
	${EndIf}
	
	Call RedistDownloadAndInstall
FunctionEnd


; ======================================================
;  Download Redist
; ======================================================
Function "RedistDownloadAndInstall"
	${If} $VCREDIST_FOUND == "0"
		SetDetailsPrint both
		DetailPrint "$(LocS_VC_SystemReq): $R9"
		SetDetailsPrint listonly
		SetOutPath $TEMP
		
!ifdef OFFLINEMODE
		File /oname=$TEMP\$VCREDIST_FILE "${VCREDIST_ROOT}\$VCREDIST_PATH"
!else
		ClearErrors
		NSISdl::download /TIMEOUT=30000 "$VCREDIST_PATH" "$TEMP\$VCREDIST_FILE"
		Pop $R0 ;Get the return value
		StrCmp $R0 "success" +4
			MessageBox MB_ICONSTOP "$(LocS_VC_Download_Failed): $R0"
			Abort
			Quit
!endif

		ClearErrors
		ExecWait '$TEMP\$VCREDIST_FILE ${VCCOMMAND}' $0
		${If} $0 == "0"
			DetailPrint "$(LocS_VC_SystemReturn)"
		${Else}
			; Check Reboot is Needed
			StrCpy $R2 ";$0;"
			Push $VCREDIST_REBOOT
			Push $R2
			Call StrStr
			Pop $R9
			
			${If} $R9 != ""
				DetailPrint "$(LocS_VC_SystemReturn)"
				SetRebootFlag true
			${Else}
				DetailPrint "$R9: $(LocS_VC_SystemReturnError) $0"
			${EndIf}
		${EndIf}

		Delete $TEMP\$VCREDIST_FILE
	${Else}
		DetailPrint "$(LocS_VC_SystemInstalled)"
	${EndIf}
FunctionEnd