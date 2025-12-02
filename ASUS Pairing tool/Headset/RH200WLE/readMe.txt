
1 dll(不需修改):驅動庫(僅保留CW6696P驅動)和藍牙擴展配置dll
BT_Setting3_Rx.dll、BT_Setting3_Tx.dll均為BT_Setting3.dll(待優化)
2 flash庫(不需修改):FlashLib.ini 
3.設備信息(不需修改)：DeviceLib.ini。當前文件僅保留CW6696P設備信息
4.主程序Exe:
	(1)release:RH200WLE_FW_Update_tool.exe 隱藏控制台窗口
	(2)Debug:	RH200WLE_FW_Update_tool.exe 控制台窗口會打印一些過程信息。
5.燒錄信息配置文件：
	(1)用戶配置文件(可修改)：UserConfig.ini
	(2)藍牙信息配置文件(保持默認值)：TransmitterBtInfocfg.ini,ReceiverBtInfocfg.ini

6.用系統api方式調研exe。
eg:
#include   "windows.h "                      
#include   "shellapi.h " 
void makePair(void)
{
	DWORD dwexit = 0;//獲取exe運行後返回值
	SHELLEXECUTEINFO ShExecInfo = {0};
	ShExecInfo.cbSize = sizeof(SHELLEXECUTEINFO);
	ShExecInfo.fMask = SEE_MASK_NOCLOSEPROCESS;
	ShExecInfo.hwnd = NULL;
	ShExecInfo.lpVerb = NULL;
	
	ShExecInfo.lpFile = ".\\Version\\RH200WLE_FW_Update_tool.exe";//exe工具        
	ShExecInfo.lpParameters = "hidmode"; //exe運行參數
	ShExecInfo.lpDirectory = NULL;
	ShExecInfo.nShow = SW_SHOW;//SW_HIDE;//SW_SHOW;
	ShExecInfo.hInstApp = NULL; 
	ShellExecuteEx(&ShExecInfo);
	WaitForSingleObject(ShExecInfo.hProcess,INFINITE);
	GetExitCodeProcess(ShExecInfo.hProcess,&dwexit);
	printf("makePair:dwexit=0x%08x\n",dwexit);
	handleErrorNumber(dwexit);//錯誤碼處理
	system("pause");//測試用
}

