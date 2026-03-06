function main()
    close all;clear;clc;

    loginWin = LoginWindow();
    mainWin = MainWindow(); 

    addlistener(loginWin, 'Login', @(~,~)loginFunc(loginWin, mainWin));
    addlistener(loginWin, 'Exit', @(~,~)exitFunc(loginWin, mainWin));
    addlistener(mainWin, 'Logout', @(~,~)logoutFunc(loginWin, mainWin));
    addlistener(mainWin, 'Exit', @(~,~)exitFunc(loginWin, mainWin));
end

function loginFunc(loginApp, mainApp)
    loginApp.uiFigure.Visible = "off";
    mainApp.showUi(loginApp.usernameEditField.Value);
end

function logoutFunc(loginApp, mainApp)
    mainApp.uiFigure.Visible = "off";
    loginApp.uiFigure.Visible = "on";
end   

function exitFunc(loginApp, mainApp)
    delete(loginApp);
    delete(mainApp);
end  