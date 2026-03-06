classdef LoginWindow < matlab.apps.AppBase
    properties (Access = public)
        uiFigure            matlab.ui.Figure
        gridLayout          matlab.ui.container.GridLayout

        titleLabel          matlab.ui.control.Label
        usernameLabel       matlab.ui.control.Label
        passwordLabel       matlab.ui.control.Label
        repeatLabel         matlab.ui.control.Label
        statusLabel         matlab.ui.control.Label
        usernameEditField   matlab.ui.control.EditField
        passwordEditField   matlab.ui.control.EditField
        repeatEditField     matlab.ui.control.EditField
        registerButton      matlab.ui.control.Button
        loginButton         matlab.ui.control.Button
        confirmButton       matlab.ui.control.Button
        returnButton        matlab.ui.control.Button
        researchCheckBox    matlab.ui.control.CheckBox
        teachingCheckBox    matlab.ui.control.CheckBox

        m_dbcenter          DBCenter
        m_lastError    
    
    end

    events
        Login
        Exit
    end  

    methods (Access = public)
        function app = LoginWindow()
            createComponents(app);
            showUi(app,'Login');

            app.m_lastError = '';
            app.m_dbcenter = DBCenter('./db/local.db');       
            if app.m_dbcenter.m_tableNum < 1
                issuccess = app.m_dbcenter.createTable('account',...
                    strcat("id INTEGER PRIMARY KEY ASC AUTOINCREMENT,",...
                    "username TEXT UNIQUE NOT NULL,",...
                    "password TEXT NOT NULL,",...
                    "scenario TEXT DEFAULT 'teaching' NOT NULL")...
                );
                if ~issuccess
                    % 建表失败
                    app.m_lastError = app.m_dbcenter.m_lastError;
                    return;  
                end  
                % 插入默认数据
                isSuccess1 = app.m_dbcenter.insertRecord('account', {'username', 'password', 'scenario'}, {'test', '123', 'administrator'});
                isSuccess2 = app.m_dbcenter.insertRecord('account', {'username', 'password', 'scenario'}, {'t', '123', 'teaching'});
                isSuccess3 = app.m_dbcenter.insertRecord('account', {'username', 'password', 'scenario'}, {'r', '123', 'research'});
                if ~(isSuccess1&&isSuccess2&&isSuccess3)
                    % 插入失败
                    app.m_lastError = app.m_dbcenter.m_lastError;
                    return;  
                end  
            end    

        end
        
        function delete(app)
            delete(app.uiFigure);
            delete(app.m_dbcenter);
        end    
        
        function showUi(app, uiName)
            % 清空所有输入内容
            app.usernameEditField.Value = '';
            app.passwordEditField.Value = '';
            app.repeatEditField.Value = '';
            app.researchCheckBox.Value = 0;
            app.teachingCheckBox.Value = 0;

            switch uiName
                case 'Login'
                    app.repeatLabel.Visible = "off";
                    app.repeatEditField.Visible = "off";
                    app.researchCheckBox.Visible = "off";
                    app.teachingCheckBox.Visible = "off";
                    app.confirmButton.Visible = "off";
                    app.returnButton.Visible = "off";
                    app.registerButton.Visible = "on";
                    app.loginButton.Visible = "on";

                    app.statusLabel.Text = '请登录';
                    app.passwordEditField.Placeholder = '请输入密码';
                    
                case 'Register'    
                    app.registerButton.Visible = "off";
                    app.loginButton.Visible = "off";
                    app.repeatLabel.Visible = "on";
                    app.repeatEditField.Visible = "on";
                    app.researchCheckBox.Visible = "on";
                    app.teachingCheckBox.Visible = "on";
                    app.confirmButton.Visible = "on";
                    app.returnButton.Visible = "on";

                    app.statusLabel.Text = '请注册';
                    app.passwordEditField.Placeholder = '密码至少为8位';
            end

            app.uiFigure.Visible = "on";
        end   
    end
    
    methods (Access = private)
        function createComponents(app)
            app.uiFigure = uifigure;
            app.uiFigure.Position = [540 320 400 300];
            app.uiFigure.Name = '欢迎登录多列车协同控制系统仿真平台';
            app.uiFigure.CloseRequestFcn = createCallbackFcn(app, @(~,~)closeRequest(app));
            
            app.gridLayout = uigridlayout(app.uiFigure);
            app.gridLayout.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x'};
            app.gridLayout.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '1x'};

            app.titleLabel = uilabel(app.gridLayout);
            app.titleLabel.Layout.Row = [1 2];
            app.titleLabel.Layout.Column = [1 6];
            app.titleLabel.HorizontalAlignment = 'center';
            app.titleLabel.FontSize = 18;
            app.titleLabel.Text = '多列车协同控制系统的 MATLAB GUI 仿真平台';

            app.usernameLabel = uilabel(app.gridLayout);
            app.usernameLabel.Layout.Row = 3;
            app.usernameLabel.Layout.Column = 2;
            app.usernameLabel.Text = '用户名:';

            app.passwordLabel = uilabel(app.gridLayout);
            app.passwordLabel.Layout.Row = 4;
            app.passwordLabel.Layout.Column = 2;
            app.passwordLabel.Text = '密码:';

            app.repeatLabel = uilabel(app.gridLayout);
            app.repeatLabel.Layout.Row = 5;
            app.repeatLabel.Layout.Column = 2;
            app.repeatLabel.Text = '重复密码:';

            app.statusLabel = uilabel(app.gridLayout);
            app.statusLabel.Layout.Row = 7;
            app.statusLabel.Layout.Column = 1;
            app.statusLabel.VerticalAlignment = 'bottom';

            app.usernameEditField = uieditfield(app.gridLayout,'text');
            app.usernameEditField.Layout.Row = 3;
            app.usernameEditField.Layout.Column = [3 5];
            app.usernameEditField.Placeholder = '请输入用户名';
            app.usernameEditField.Tooltip = '请输入您的用户名';

            app.passwordEditField = uieditfield(app.gridLayout,'text');
            app.passwordEditField.Layout.Row = 4;
            app.passwordEditField.Layout.Column = [3 5];
            app.passwordEditField.Tooltip = '请输入您的密码';

            app.repeatEditField = uieditfield(app.gridLayout,'text');
            app.repeatEditField.Layout.Row = 5;
            app.repeatEditField.Layout.Column = [3 5];
            app.repeatEditField.Placeholder = '请重复输入密码';
            app.repeatEditField.Tooltip = '请再次输入您的密码';

            app.registerButton = uibutton(app.gridLayout,'push');
            app.registerButton.Layout.Row = 6;
            app.registerButton.Layout.Column = [2 3];
            app.registerButton.Text = '注册';
            app.registerButton.ButtonPushedFcn = createCallbackFcn(app,@(~,~)showUi(app,'Register'));

            app.loginButton = uibutton(app.gridLayout,'push');
            app.loginButton.Layout.Row = 6;
            app.loginButton.Layout.Column = [4 5];
            app.loginButton.Text = '登录';
            app.loginButton.ButtonPushedFcn = createCallbackFcn(app, @(~,~)loginBtnPushed(app));

            app.confirmButton = uibutton(app.gridLayout,'push');
            app.confirmButton.Layout.Row = 7;
            app.confirmButton.Layout.Column = [2 3];
            app.confirmButton.Text = '确定';
            app.confirmButton.ButtonPushedFcn = createCallbackFcn(app, @(~,~)confirmBtnPushed(app));

            app.returnButton = uibutton(app.gridLayout,'push');
            app.returnButton.Layout.Row = 7;
            app.returnButton.Layout.Column = [4 5];
            app.returnButton.Text = '返回';
            app.returnButton.ButtonPushedFcn = createCallbackFcn(app, @(~,~)showUi(app,'Login'));

            app.researchCheckBox = uicheckbox(app.gridLayout);
            app.researchCheckBox.Text = '科研场景';
            app.researchCheckBox.Layout.Row = 6;
            app.researchCheckBox.Layout.Column = [2 3];
            app.researchCheckBox.ValueChangedFcn = createCallbackFcn(app, @(~,~)researchValueChanged(app));

            app.teachingCheckBox = uicheckbox(app.gridLayout);
            app.teachingCheckBox.Text = '教学场景';
            app.teachingCheckBox.Layout.Row = 6;
            app.teachingCheckBox.Layout.Column = [4 5];
            app.teachingCheckBox.ValueChangedFcn = createCallbackFcn(app, @(~,~)teachingValueChanged(app));
        end
        
        function closeRequest(app)
            choice = uiconfirm(app.uiFigure,'确定要退出系统吗?','退出',"Options",["确定退出","我再想想"],"DefaultOption",2,"CancelOption",2);
            if strcmp (choice, '确定退出')
                notify(app,'Exit');
            end    
        end

        function loginBtnPushed(app)
            % 获取输入框
            username = app.usernameEditField.Value;
            password = app.passwordEditField.Value;

            % 检查输入框是否均为空
            if isempty(username)
                uialert(app.uiFigure,'用户名不能为空!','错误');
                return;
            end
            if isempty(password)
                uialert(app.uiFigure,'密码不能为空!','错误');
                return;
            end   
              
            % 将输入框内容与数据库比较 检查用户名是否存在
            rf = rowfilter("username");
            rf = (rf.username == username);
            resultTable = app.m_dbcenter.selectAllCondition("account",rf);
            if height(resultTable) < 1
                % 用户名不存在
                uialert(app.uiFigure,'用户名不存在, 请先注册!','错误');
                app.usernameEditField.Value = '';
                app.passwordEditField.Value = '';
                return;
            end

            % 用户名存在 检查密码是否匹配
            if ~strcmp(resultTable.password, password)
                % 不相同
                uialert(app.uiFigure,'密码错误, 请重新输入!','错误');
                app.passwordEditField.Value = '';
                return;
            end    

            % 匹配成功 进入主界面
            notify(app,'Login');

            % 仅清空密码 退出账号时保留用户名
            app.passwordEditField.Value = '';
        end

        function confirmBtnPushed(app)
            % 获取输入框
            username = app.usernameEditField.Value;
            password = app.passwordEditField.Value;
            repeat = app.repeatEditField.Value;

            % 检查输入框是否均为空
            if isempty(username)
                uialert(app.uiFigure,'用户名不能为空!','错误');
                return;
            end
            if isempty(password)
                uialert(app.uiFigure,'密码不能为空!','错误');
                return;
            end   
            if isempty(repeat)
                uialert(app.uiFigure,'请您再次输入密码!','错误');
                return;
            end
            % 检查是否勾选身份
            if (app.researchCheckBox.Value == 0) && (app.teachingCheckBox.Value == 0)
                uialert(app.uiFigure,'请选择使用场景!','错误');
                return;
            end

            % 检查密码是否合规
            if length(password) < 8
                uialert(app.uiFigure,'密码长度不足8位, 请重新输入!','错误');
                app.passwordEditField.Value = '';
                app.repeatEditField.Value = '';
                return;
            end
            if ~strcmp(password,repeat)
                uialert(app.uiFigure,'两次输入的密码不一致, 请重新输入!','错误');
                app.passwordEditField.Value = '';
                app.repeatEditField.Value = '';
                return;
            end
            
            % 将输入框内容与数据库比较 检查用户名是否存在
            rf = rowfilter("username");
            rf = (rf.username == username);
            resultTable = app.m_dbcenter.selectAllCondition("account",rf);
            if height(resultTable) > 0 
                % 用户名存在
                uialert(app.uiFigure,'用户名已存在, 请去登录!','错误');
                return;
            else
                % 用户名不存在 准备写入账号信息
                if app.researchCheckBox.Value
                    scenario = 'research';
                elseif app.teachingCheckBox.Value
                    scenario = 'teaching';
                end    
                
                isSuccess = app.m_dbcenter.insertRecord('account', {'username', 'password', 'scenario'}, {username, password, scenario});
                if ~isSuccess
                    % 插入失败
                    app.m_lastError = app.m_dbcenter.m_lastError;
                    return;
                    
                end    
                
                % 注册成功
                uialert(app.uiFigure,'注册成功, 请去登录!','成功','Icon','success')
            end

            % 返回登录界面
            showUi(app,'Login');
            app.usernameEditField.Value = username;
        end      

        function researchValueChanged(app)
            if app.researchCheckBox.Value
                app.teachingCheckBox.Value = 0;
            else
                app.teachingCheckBox.Value = 1;
            end        
        end    

        function teachingValueChanged(app)
            if app.teachingCheckBox.Value
                app.researchCheckBox.Value = 0;
            else
                app.researchCheckBox = 1;
            end        
        end
    end
end