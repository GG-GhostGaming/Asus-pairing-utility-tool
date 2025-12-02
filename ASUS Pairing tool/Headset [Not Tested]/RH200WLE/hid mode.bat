@echo off
cd /d %~dp0
start RH200WLE_FW_Update_tool.exe hidmode     || (echo Error:RH200WLE_FW_Update_tool & goto err)
echo Success:update done! & exit /b
:err
pause