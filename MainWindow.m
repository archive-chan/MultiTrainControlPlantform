classdef MainWindow < matlab.apps.AppBase
    properties (Access = public)
        uiFigure                    matlab.ui.Figure
        uiLayout                    matlab.ui.container.GridLayout

        %% toolbar
        toolBarLayout               matlab.ui.container.GridLayout
        startButton                 matlab.ui.control.Button
        pauseButton                 matlab.ui.control.Button
        continueButton              matlab.ui.control.Button
        resultButton                matlab.ui.control.Button
        replayButton                matlab.ui.control.Button
        separator1Label             matlab.ui.control.Label
        paramsAddButton             matlab.ui.control.Button
        paramsDeleteButton          matlab.ui.control.Button
        separator2Label             matlab.ui.control.Label
        accountImportButton         matlab.ui.control.Button
        dataExportButton            matlab.ui.control.Button

        %% sideBar
        sideBarLayout               matlab.ui.container.GridLayout

        sideSimulPanel              matlab.ui.container.Panel
        sideSimulLayout             matlab.ui.container.GridLayout
        basicParamButton            matlab.ui.control.Button
        advanParamButton            matlab.ui.control.Button
        simulVisualButton           matlab.ui.control.Button
        historyDataButton           matlab.ui.control.Button

        sideSystemPanel             matlab.ui.container.Panel
        sideSystemLayout            matlab.ui.container.GridLayout
        logoutButton                matlab.ui.control.Button
        aboutButton                 matlab.ui.control.Button

        sideStatusPanel             matlab.ui.container.Panel
        sideStatusLayout            matlab.ui.container.GridLayout
        statusLabel                 matlab.ui.control.Label
        statusLamp                  matlab.ui.control.Lamp

        %% mainPanel
        mainPanel                   matlab.ui.container.Panel
        mainLayout                  matlab.ui.container.GridLayout

        %% selectLayout
        selectLayout                matlab.ui.container.GridLayout
        currentParamsLabel          matlab.ui.control.Label
        currentParamsDropDown       matlab.ui.control.DropDown
        recordsLabel                matlab.ui.control.Label
        recordsDropDown             matlab.ui.control.DropDown

        %% basicParamLayout
        basicParamLayout            matlab.ui.container.GridLayout

        % simulBasis
        simulBasisPanel             matlab.ui.container.Panel
        simulBasisLayout            matlab.ui.container.GridLayout
        frequencyLabel              matlab.ui.control.Label
        frequencySpinner            matlab.ui.control.Spinner
        totalTimeLabel              matlab.ui.control.Label
        totalTimeSpinner            matlab.ui.control.Spinner
        
        % trainParam
        trainParamPanel             matlab.ui.container.Panel
        trainParamLayout            matlab.ui.container.GridLayout
        trainNumLabel               matlab.ui.control.Label
        trainNumSpinner             matlab.ui.control.Spinner
        trainLengthLabel            matlab.ui.control.Label
        trainLengthSpinner          matlab.ui.control.Spinner
        trainSpacingLabel           matlab.ui.control.Label
        trainSpacingSpinner         matlab.ui.control.Spinner
        startPosiLabel              matlab.ui.control.Label
        startPosiEditField          matlab.ui.control.EditField
        startVeloLabel              matlab.ui.control.Label
        startVeloEditField          matlab.ui.control.EditField

        % leaderTraj
        leaderTrajPanel             matlab.ui.container.Panel
        leaderTrajLayout            matlab.ui.container.GridLayout
        trajDesignLabel             matlab.ui.control.Label
        trajDesignDropDown          matlab.ui.control.DropDown
        trajPosiLabel               matlab.ui.control.Label
        trajPosiEditField           matlab.ui.control.EditField
        trajVeloLabel               matlab.ui.control.Label
        trajVeloEditField           matlab.ui.control.EditField

        % topology
        topologyPanel               matlab.ui.container.Panel
        topologyLayout              matlab.ui.container.GridLayout
        currentTopologyLabel        matlab.ui.control.Label
        currentTopologyDropDown     matlab.ui.control.DropDown

        % ctrlParams
        ctrlParamsPanel             matlab.ui.container.Panel
        ctrlParamsLayout            matlab.ui.container.GridLayout
        KpLabel                     matlab.ui.control.Label
        KpSpinner                   matlab.ui.control.Spinner
        KvLabel                     matlab.ui.control.Label
        KvSpinner                   matlab.ui.control.Spinner

        % physical
        physicalPanel               matlab.ui.container.Panel
        physicalLayout              matlab.ui.container.GridLayout
        veloLimitLabel              matlab.ui.control.Label
        veloLimitSpinner            matlab.ui.control.Spinner
        ctrlLimitLabel              matlab.ui.control.Label
        ctrlLimitSpinner            matlab.ui.control.Spinner
        c0Label                     matlab.ui.control.Label
        c0Spinner                   matlab.ui.control.Spinner
        c1Label                     matlab.ui.control.Label
        c1Spinner                   matlab.ui.control.Spinner
        c2Label                     matlab.ui.control.Label
        c2Spinner                   matlab.ui.control.Spinner

        basicParamSaveButton        matlab.ui.control.Button

        %% advanLayout
        advanParamLayout            matlab.ui.container.GridLayout

        advanParamLabel             matlab.ui.control.Label
        advanParamSwitch            matlab.ui.control.Switch

        % delay
        delayParamPanel             matlab.ui.container.Panel
        delayParamLayout            matlab.ui.container.GridLayout

        delayParamLabel             matlab.ui.control.Label
        delayParamSwitch            matlab.ui.control.Switch

        delayLayout                 matlab.ui.container.GridLayout
        delayModeLabel              matlab.ui.control.Label
        delayModeDropDown           matlab.ui.control.DropDown
        fixDelayLabel               matlab.ui.control.Label
        fixDelaySpinner             matlab.ui.control.Spinner
        flucDelayLabel              matlab.ui.control.Label
        flucDelaySpinner            matlab.ui.control.Spinner

        % noise
        noiseParamPanel             matlab.ui.container.Panel
        noiseParamLayout            matlab.ui.container.GridLayout

        noiseParamLabel             matlab.ui.control.Label
        noiseParamSwitch            matlab.ui.control.Switch

        noiseLayout                 matlab.ui.container.GridLayout
        noiseModeLabel              matlab.ui.control.Label
        noiseModeDropDown           matlab.ui.control.DropDown
        frictionNoiseLabel          matlab.ui.control.Label
        frictionNoiseSpinner        matlab.ui.control.Spinner
        elecNoiseLabel              matlab.ui.control.Label
        elecNoiseSpinner            matlab.ui.control.Spinner
        alphaLabel                  matlab.ui.control.Label
        alphaSpinner                matlab.ui.control.Spinner

        % energy
        energyParamPanel            matlab.ui.container.Panel
        energyParamLayout           matlab.ui.container.GridLayout

        energyParamLabel            matlab.ui.control.Label
        energyParamSwitch           matlab.ui.control.Switch

        energyLayout                matlab.ui.container.GridLayout
        energyRealtimeLabel         matlab.ui.control.Label
        energyRealtimeTextArea      matlab.ui.control.TextArea

        advanParamSaveButton        matlab.ui.control.Button
        
        %% visualLayout
        visualLayout                matlab.ui.container.GridLayout
        animeAxes                   matlab.ui.control.UIAxes
        positionAxes                matlab.ui.control.UIAxes
        velocityAxes                matlab.ui.control.UIAxes
        errorAxes                   matlab.ui.control.UIAxes
        controlInputAxes            matlab.ui.control.UIAxes

        %% historyLayout
        historyLayout               matlab.ui.container.GridLayout
        historyTable                matlab.ui.control.Table

        %% aboutLayout
        aboutLayout                  matlab.ui.container.GridLayout

        %% 成员变量
        m_lastError
        m_dbCenter                  DBCenter
        m_jsonHelper                JsonHelper

        m_currentScenario
        m_currentPanel
        m_currentStatus

        m_lastResult

        m_animeRectangles
        m_positionLines
        m_velocityLines
        m_errorLines
        m_controlInputLines

        m_stepTimer
        m_stepNumGone

        isParamSaved
  
    end

    events
        Logout
        Exit
    end

    methods (Access = public)
        function app = MainWindow()
            setupUi(app);

            app.m_lastError = '';
            app.m_dbCenter = DBCenter('./db/local.db');
            app.m_jsonHelper = JsonHelper('./params');

            app.m_currentScenario = '';
            app.m_currentPanel = '';
            app.m_currentStatus = '';

            app.m_lastResult = {};
            
            app.m_animeRectangles = [];
            app.m_positionLines = [];
            app.m_velocityLines = [];
            app.m_errorLines = [];
            app.m_controlInputLines = [];

            app.m_stepTimer = timer('Name','steptimer');
            app.m_stepTimer.ExecutionMode = 'fixedRate';
            app.m_stepTimer.StartFcn = @(~,~)stepStartFunc(app);
            app.m_stepTimer.TimerFcn = @(~,~)stepTimerFunc(app);
            app.m_stepTimer.StopFcn = @(~,~)stepStopFunc(app);
            app.m_stepNumGone = 0;

            app.isParamSaved = true;
        end

        function delete(app)
            stop(app.m_stepTimer);
            delete(app.uiFigure);
            delete(app.m_dbCenter);
            
        end

        function showUi(app, username)
            % 1.获取账号场景 根据场景准备 UI
            rf = rowfilter("username");
            rf = (rf.username == username);
            resultTable = app.m_dbCenter.selectFieldCondition('account',{'username','scenario'},rf);
            app.m_currentScenario = resultTable.scenario;

            % teaching 和 admin 场景的 toolbar 按钮排布
            app.startButton.Layout.Column = 1;
            app.pauseButton.Layout.Column = 2;
            app.continueButton.Layout.Column = 3;
            app.resultButton.Layout.Column = 4;
            app.replayButton.Layout.Column = 5;
            % toolbar 按钮显示隐藏
            app.toolBarLayout.ColumnWidth{1} = 64;
            app.toolBarLayout.ColumnWidth{2} = 64;
            app.toolBarLayout.ColumnWidth{3} = 64;
            app.toolBarLayout.ColumnWidth{4} = 64;
            app.toolBarLayout.ColumnWidth{5} = 64;
            app.toolBarLayout.ColumnWidth{10} = 0;
            % teaching 和 admin 场景的动画演示区显示
            app.visualLayout.RowHeight{1} = '1x';
            app.animeAxes.Visible = "on";

            switch app.m_currentScenario;
                case 'teaching'
                    % 隐藏侧边栏高级按钮
                    app.sideSimulLayout.RowHeight{2} = 0;
                    
                case 'research'
                    % 显示侧边栏高级按钮
                    app.sideSimulLayout.RowHeight{2} = 'fit';

                    % 重新排布 toolbar 按钮
                    app.resultButton.Layout.Column = 1;
                    app.replayButton.Layout.Column = 2;
                    app.startButton.Layout.Column = 3;
                    app.pauseButton.Layout.Column = 4;
                    app.continueButton.Layout.Column = 5;
                    % 隐藏 toolbar 基础按钮
                    app.toolBarLayout.ColumnWidth{3} = 0;
                    app.toolBarLayout.ColumnWidth{4} = 0;
                    app.toolBarLayout.ColumnWidth{5} = 0;

                    % 关掉动画演示区
                    app.visualLayout.RowHeight{1} = 0;
                    app.animeAxes.Visible = "off";

                otherwise
                    % 显示所有侧边栏
                    app.sideSimulLayout.RowHeight{2} = 'fit';

                    % 显示账号导入按钮
                    app.toolBarLayout.ColumnWidth{10} = 64;
            end  

            % 2.显示可视化Panel
            setPanel(app,'可视化');

            % 3.设置状态
            setStatus(app,'准备就绪');
        
            % 4.还原初始数据
            initData(app);            

            % 5.最后显示窗口
            app.uiFigure.Visible = "on";

        end

    end

    methods (Access = private)
        function setupUi(app)
            app.uiFigure = uifigure('Visible', 'off');
            app.uiFigure.Position = [120 100 1200 720];
            app.uiFigure.Name = '多列车协同控制系统仿真平台';
            app.uiFigure.CloseRequestFcn = createCallbackFcn(app,@closeRequest);

            app.uiLayout = uigridlayout(app.uiFigure);
            app.uiLayout.ColumnWidth = {128, '1x'};
            app.uiLayout.RowHeight = {64,'1x'};
            app.uiLayout.Padding = [0 10 10 0];

            %% toolBar
            app.toolBarLayout = uigridlayout(app.uiLayout);
            app.toolBarLayout.ColumnWidth = {64, 64, 64, 64, 64, 20, 64, 64, 20, 64, 64, '1x'};
            app.toolBarLayout.RowHeight = {'1x'};
            app.toolBarLayout.ColumnSpacing = 0;
            app.toolBarLayout.RowSpacing = 0;
            app.toolBarLayout.Padding = [0 0 0 0];
            app.toolBarLayout.Layout.Row = 1;
            app.toolBarLayout.Layout.Column = [1 2];

            app.startButton = uibutton(app.toolBarLayout, 'push');
            app.startButton.Layout.Row = 1;
            app.startButton.Text = '开始仿真';
            app.startButton.ButtonPushedFcn = createCallbackFcn(app,@startBtnPushed);

            app.pauseButton = uibutton(app.toolBarLayout, 'push');
            app.pauseButton.Layout.Row = 1;
            app.pauseButton.Text = '暂停仿真';
            app.pauseButton.ButtonPushedFcn = createCallbackFcn(app,@pauseBtnPushed);

            app.continueButton = uibutton(app.toolBarLayout, 'push');
            app.continueButton.Layout.Row = 1;
            app.continueButton.Text = '继续仿真';
            app.continueButton.ButtonPushedFcn = createCallbackFcn(app,@continueBtnPushed);

            app.resultButton = uibutton(app.toolBarLayout, 'push');
            app.resultButton.Layout.Row = 1;
            app.resultButton.Text = '仿真结果';
            app.resultButton.ButtonPushedFcn = createCallbackFcn(app,@resultBtnPushed);

            app.replayButton = uibutton(app.toolBarLayout, 'push');
            app.replayButton.Layout.Row = 1;
            app.replayButton.Text = '回放仿真';
            app.replayButton.ButtonPushedFcn = createCallbackFcn(app,@replayBtnPushed);

            app.separator1Label = uilabel(app.toolBarLayout);
            app.separator1Label.HorizontalAlignment = 'center';
            app.separator1Label.FontSize = 20;
            app.separator1Label.Layout.Row = 1;
            app.separator1Label.Layout.Column = 6;
            app.separator1Label.Text = '|';
            app.separator1Label.Enable = "off";

            app.paramsAddButton = uibutton(app.toolBarLayout, 'push');
            app.paramsAddButton.Layout.Row = 1;
            app.paramsAddButton.Layout.Column = 7;
            app.paramsAddButton.Text = '新增参数集';
            app.paramsAddButton.FontSize = 11;
            app.paramsAddButton.ButtonPushedFcn = createCallbackFcn(app,@paramsAddBtnPushed);

            app.paramsDeleteButton = uibutton(app.toolBarLayout, 'push');
            app.paramsDeleteButton.Layout.Row = 1;
            app.paramsDeleteButton.Layout.Column = 8;
            app.paramsDeleteButton.Text = '删除参数集';
            app.paramsDeleteButton.FontSize = 11;
            app.paramsDeleteButton.ButtonPushedFcn = createCallbackFcn(app,@paramsDeleteBtnPushed);

            app.separator2Label = uilabel(app.toolBarLayout);
            app.separator2Label.HorizontalAlignment = 'center';
            app.separator2Label.FontSize = 20;
            app.separator2Label.Layout.Row = 1;
            app.separator2Label.Layout.Column = 9;
            app.separator2Label.Text = '|';
            app.separator2Label.Enable = "off";

            app.accountImportButton = uibutton(app.toolBarLayout, 'push');
            app.accountImportButton.Layout.Row = 1;
            app.accountImportButton.Layout.Column = 10;
            app.accountImportButton.Text = '导入账号';

            app.dataExportButton = uibutton(app.toolBarLayout, 'push');
            app.dataExportButton.Layout.Row = 1;
            app.dataExportButton.Layout.Column = 11;
            app.dataExportButton.Text = '导出数据';

            %% sideBar
            app.sideBarLayout = uigridlayout(app.uiLayout);
            app.sideBarLayout.ColumnWidth = {'1x'};
            app.sideBarLayout.RowHeight = {'1x', 'fit', 'fit'};
            app.sideBarLayout.Padding = [10 0 0 0];
            app.sideBarLayout.Layout.Row = 2;
            app.sideBarLayout.Layout.Column = 1;

            % sideSimulPanel
            app.sideSimulPanel = uipanel(app.sideBarLayout);
            app.sideSimulPanel.Title = '仿真';
            app.sideSimulPanel.Layout.Row = 1;
            app.sideSimulPanel.Layout.Column = 1;
            app.sideSimulPanel.FontSize = 14;

            app.sideSimulLayout = uigridlayout(app.sideSimulPanel);
            app.sideSimulLayout.ColumnWidth = {'1x'};
            app.sideSimulLayout.RowHeight = {'fit', 'fit', 'fit', 'fit', '1x'};

            app.basicParamButton = uibutton(app.sideSimulLayout, 'push');
            app.basicParamButton.Layout.Row = 1;
            app.basicParamButton.Layout.Column = 1;
            app.basicParamButton.Text = '基本参数';
            app.basicParamButton.ButtonPushedFcn = createCallbackFcn(app,@(src,event)setPanel(app,'基本参数'));

            app.advanParamButton = uibutton(app.sideSimulLayout, 'push');
            app.advanParamButton.Layout.Row = 2;
            app.advanParamButton.Layout.Column = 1;
            app.advanParamButton.Text = '高级参数';
            app.advanParamButton.ButtonPushedFcn = createCallbackFcn(app,@(src,event)setPanel(app,'高级参数'));

            app.simulVisualButton = uibutton(app.sideSimulLayout, 'push');
            app.simulVisualButton.Layout.Row = 3;
            app.simulVisualButton.Layout.Column = 1;
            app.simulVisualButton.Text = '仿真可视化';
            app.simulVisualButton.ButtonPushedFcn = createCallbackFcn(app,@(src,event)setPanel(app,'可视化'));

            app.historyDataButton = uibutton(app.sideSimulLayout, 'push');
            app.historyDataButton.Layout.Row = 4;
            app.historyDataButton.Layout.Column = 1;
            app.historyDataButton.Text = '历史数据';
            app.historyDataButton.ButtonPushedFcn = createCallbackFcn(app,@(src,event)setPanel(app,'历史数据'),true);

            % sideSystemPanel
            app.sideSystemPanel = uipanel(app.sideBarLayout);
            app.sideSystemPanel.Title = '系统';
            app.sideSystemPanel.Layout.Row = 2;
            app.sideSystemPanel.Layout.Column = 1;
            app.sideSystemPanel.FontSize = 14;

            app.sideSystemLayout = uigridlayout(app.sideSystemPanel);
            app.sideSystemLayout.ColumnWidth = {'1x'};
            app.sideSystemLayout.RowHeight = {'fit', 'fit'};

            app.logoutButton = uibutton(app.sideSystemLayout, 'push');
            app.logoutButton.Layout.Row = 1;
            app.logoutButton.Layout.Column = 1;
            app.logoutButton.Text = '退出登录';
            app.logoutButton.ButtonPushedFcn = createCallbackFcn(app,@logoutBtnPushed,true);

            app.aboutButton = uibutton(app.sideSystemLayout, 'push');
            app.aboutButton.Layout.Row = 2;
            app.aboutButton.Layout.Column = 1;
            app.aboutButton.Text = '关于';
            app.aboutButton.ButtonPushedFcn = createCallbackFcn(app,@(src,event)setPanel(app,'关于'),true);

            % sideStatusPanel
            app.sideStatusPanel = uipanel(app.sideBarLayout);
            app.sideStatusPanel.Title = '状态';
            app.sideStatusPanel.Layout.Row = 3;
            app.sideStatusPanel.Layout.Column = 1;
            app.sideStatusPanel.FontSize = 14;

            app.sideStatusLayout = uigridlayout(app.sideStatusPanel);
            app.sideStatusLayout.ColumnWidth = {'1x', '1x', '1x'};
            app.sideStatusLayout.RowHeight = {'1x'};

            app.statusLabel = uilabel(app.sideStatusLayout);
            app.statusLabel.Layout.Row = 1;
            app.statusLabel.Layout.Column = [2 3];
            app.statusLabel.Text = '准备就绪';

            app.statusLamp = uilamp(app.sideStatusLayout);
            app.statusLamp.Layout.Row = 1;
            app.statusLamp.Layout.Column = 1;
            app.statusLamp.Color = [0.2314 0.6667 0.1961];

            %% mainPanel
            app.mainPanel = uipanel(app.uiLayout);
            app.mainPanel.Layout.Row = 2;
            app.mainPanel.Layout.Column = 2;
            app.mainPanel.FontSize = 14;

            app.mainLayout = uigridlayout(app.mainPanel);
            app.mainLayout.ColumnWidth = {'1x'};
            app.mainLayout.RowHeight = {'fit', '1x'};

            % selectLayout
            app.selectLayout = uigridlayout(app.mainLayout);
            app.selectLayout.ColumnWidth = {'fit', '1x', 'fit', '1x'};
            app.selectLayout.RowHeight = {'1x'};
            app.selectLayout.Padding = [0 0 0 0];
            app.selectLayout.Layout.Row = 1;
            app.selectLayout.Layout.Column = 1;

            app.currentParamsLabel = uilabel(app.selectLayout);
            app.currentParamsLabel.Layout.Row = 1;
            app.currentParamsLabel.Layout.Column = 1;
            app.currentParamsLabel.Text = '当前参数集';

            app.currentParamsDropDown = uidropdown(app.selectLayout);
            app.currentParamsDropDown.Layout.Row = 1;
            app.currentParamsDropDown.Layout.Column = 2;
            app.currentParamsDropDown.ValueChangedFcn = createCallbackFcn(app,@currentParamsValueChanged,true);

            app.recordsLabel = uilabel(app.selectLayout);
            app.recordsLabel.Layout.Row = 1;
            app.recordsLabel.Layout.Column = 3;
            app.recordsLabel.Text = '仿真记录';

            app.recordsDropDown = uidropdown(app.selectLayout);
            app.recordsDropDown.Layout.Row = 1;
            app.recordsDropDown.Layout.Column = 4;

            %% basicParamLayout
            app.basicParamLayout = uigridlayout(app.mainLayout);
            app.basicParamLayout.ColumnWidth = {'1x', 100};
            app.basicParamLayout.RowHeight = {'1x', '1.5x', '1x', '1x', '1x', '1.5x', '0.5x', 'fit'};
            app.basicParamLayout.Padding = [0 0 0 0];
            app.basicParamLayout.Layout.Row = 2;
            app.basicParamLayout.Layout.Column = 1;

            % simulBasis
            app.simulBasisPanel = uipanel(app.basicParamLayout);
            app.simulBasisPanel.BorderType = 'none';
            app.simulBasisPanel.Title = '仿真基础';
            app.simulBasisPanel.Layout.Row = 1;
            app.simulBasisPanel.Layout.Column = 1;
            app.simulBasisPanel.FontWeight = 'bold';
            app.simulBasisPanel.FontSize = 14;

            app.simulBasisLayout = uigridlayout(app.simulBasisPanel);
            app.simulBasisLayout.ColumnWidth = {'fit', 216, 'fit', 216};
            app.simulBasisLayout.RowHeight = {'fit'};
            app.simulBasisLayout.Padding = [5 5 5 5];

            app.frequencyLabel = uilabel(app.simulBasisLayout);
            app.frequencyLabel.Layout.Row = 1;
            app.frequencyLabel.Layout.Column = 1;
            app.frequencyLabel.Text = '采样时间';
            app.frequencyLabel.HorizontalAlignment = 'right';

            app.frequencySpinner = uispinner(app.simulBasisLayout);
            app.frequencySpinner.Layout.Row = 1;
            app.frequencySpinner.Layout.Column = 2;
            app.frequencySpinner.HorizontalAlignment = 'left';
            app.frequencySpinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.totalTimeLabel = uilabel(app.simulBasisLayout);
            app.totalTimeLabel.Layout.Row = 1;
            app.totalTimeLabel.Layout.Column = 3;
            app.totalTimeLabel.Text = '总时长';
            app.totalTimeLabel.HorizontalAlignment = 'right';

            app.totalTimeSpinner = uispinner(app.simulBasisLayout);
            app.totalTimeSpinner.Layout.Row = 1;
            app.totalTimeSpinner.Layout.Column = 4;
            app.totalTimeSpinner.HorizontalAlignment = 'left';
            app.totalTimeSpinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            % trainParam
            app.trainParamPanel = uipanel(app.basicParamLayout);
            app.trainParamPanel.BorderType = 'none';
            app.trainParamPanel.Title = '列车参数';
            app.trainParamPanel.Layout.Row = 2;
            app.trainParamPanel.Layout.Column = 1;
            app.trainParamPanel.FontWeight = 'bold';
            app.trainParamPanel.FontSize = 14;

            app.trainParamLayout = uigridlayout(app.trainParamPanel);
            app.trainParamLayout.ColumnWidth = {'fit', 216, 'fit', 216, 'fit', 216};
            app.trainParamLayout.RowHeight = {'fit', 'fit'};
            app.trainParamLayout.Padding = [5 5 5 5];

            app.trainNumLabel = uilabel(app.trainParamLayout);
            app.trainNumLabel.Layout.Row = 1;
            app.trainNumLabel.Layout.Column = 1;
            app.trainNumLabel.Text = '列车数量';
            app.trainNumLabel.HorizontalAlignment = 'right';

            app.trainNumSpinner = uispinner(app.trainParamLayout);
            app.trainNumSpinner.Layout.Row = 1;
            app.trainNumSpinner.Layout.Column = 2;
            app.trainNumSpinner.HorizontalAlignment = 'left';
            app.trainNumSpinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.trainLengthLabel = uilabel(app.trainParamLayout);
            app.trainLengthLabel.Layout.Row = 1;
            app.trainLengthLabel.Layout.Column = 3;
            app.trainLengthLabel.Text = '列车长度';
            app.trainLengthLabel.HorizontalAlignment = 'right';
            
            app.trainLengthSpinner = uispinner(app.trainParamLayout);
            app.trainLengthSpinner.Layout.Row = 1;
            app.trainLengthSpinner.Layout.Column = 4;
            app.trainLengthSpinner.HorizontalAlignment = 'left';
            app.trainLengthSpinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.trainSpacingLabel = uilabel(app.trainParamLayout);
            app.trainSpacingLabel.Layout.Row = 1;
            app.trainSpacingLabel.Layout.Column = 5;
            app.trainSpacingLabel.Text = '列车间距';
            app.trainSpacingLabel.HorizontalAlignment = 'right';

            app.trainSpacingSpinner = uispinner(app.trainParamLayout);
            app.trainSpacingSpinner.Layout.Row = 1;
            app.trainSpacingSpinner.Layout.Column = 6;
            app.trainSpacingSpinner.HorizontalAlignment = 'left';
            app.trainSpacingSpinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.startPosiLabel = uilabel(app.trainParamLayout);
            app.startPosiLabel.Layout.Row = 2;
            app.startPosiLabel.Layout.Column = 1;
            app.startPosiLabel.Text = '初始位置';
            app.startPosiLabel.HorizontalAlignment = 'right';

            app.startPosiEditField = uieditfield(app.trainParamLayout, 'text');
            app.startPosiEditField.Layout.Row = 2;
            app.startPosiEditField.Layout.Column = 2;
            app.startPosiEditField.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.startVeloLabel = uilabel(app.trainParamLayout);
            app.startVeloLabel.Layout.Row = 2;
            app.startVeloLabel.Layout.Column = 3;
            app.startVeloLabel.Text = '初始速度';
            app.startVeloLabel.HorizontalAlignment = 'right';

            app.startVeloEditField = uieditfield(app.trainParamLayout, 'text');
            app.startVeloEditField.Layout.Row = 2;
            app.startVeloEditField.Layout.Column = 4;
            app.startVeloEditField.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            % leaderTraj
            app.leaderTrajPanel = uipanel(app.basicParamLayout);
            app.leaderTrajPanel.BorderType = 'none';
            app.leaderTrajPanel.Title = '领航车轨迹';
            app.leaderTrajPanel.Layout.Row = 3;
            app.leaderTrajPanel.Layout.Column = 1;
            app.leaderTrajPanel.FontWeight = 'bold';
            app.leaderTrajPanel.FontSize = 14;

            app.leaderTrajLayout = uigridlayout(app.leaderTrajPanel);
            app.leaderTrajLayout.ColumnWidth = {'fit', 216, 'fit', 216, 'fit', 216};
            app.leaderTrajLayout.RowHeight = {'fit'};
            app.leaderTrajLayout.Padding = [5 5 5 5];

            app.trajDesignLabel = uilabel(app.leaderTrajLayout);
            app.trajDesignLabel.Layout.Row = 1;
            app.trajDesignLabel.Layout.Column = 1;
            app.trajDesignLabel.Text = '轨迹设计';
            app.trajDesignLabel.HorizontalAlignment = 'right';

            app.trajDesignDropDown = uidropdown(app.leaderTrajLayout);
            app.trajDesignDropDown.Layout.Row = 1;
            app.trajDesignDropDown.Layout.Column = 2;
            app.trajDesignDropDown.Items = {'按位置','按速度'};
            app.trajDesignDropDown.ValueChangedFcn = createCallbackFcn(app,@trajDesignValueChanged,true);

            app.trajPosiLabel = uilabel(app.leaderTrajLayout);
            app.trajPosiLabel.Layout.Row = 1;
            app.trajPosiLabel.Layout.Column = 3;
            app.trajPosiLabel.Text = '位置轨迹';
            app.trajPosiLabel.HorizontalAlignment = 'right';

            app.trajPosiEditField = uieditfield(app.leaderTrajLayout, 'text');
            app.trajPosiEditField.Layout.Row = 1;
            app.trajPosiEditField.Layout.Column = 4;
            app.trajPosiEditField.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.trajVeloLabel = uilabel(app.leaderTrajLayout);
            app.trajVeloLabel.Layout.Row = 1;
            app.trajVeloLabel.Layout.Column = 5;
            app.trajVeloLabel.Text = '速度轨迹';
            app.trajVeloLabel.HorizontalAlignment = 'right';

            app.trajVeloEditField = uieditfield(app.leaderTrajLayout, 'text');
            app.trajVeloEditField.Layout.Row = 1;
            app.trajVeloEditField.Layout.Column = 6;
            app.trajVeloEditField.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            % topology
            app.topologyPanel = uipanel(app.basicParamLayout);
            app.topologyPanel.BorderType = 'none';
            app.topologyPanel.Title = '通信拓扑';
            app.topologyPanel.Layout.Row = 4;
            app.topologyPanel.Layout.Column = 1;
            app.topologyPanel.FontWeight = 'bold';
            app.topologyPanel.FontSize = 14;

            app.topologyLayout = uigridlayout(app.topologyPanel);
            app.topologyLayout.ColumnWidth = {'fit', 216};
            app.topologyLayout.RowHeight = {'fit'};
            app.topologyLayout.Padding = [5 5 5 5];

            app.currentTopologyLabel = uilabel(app.topologyLayout);
            app.currentTopologyLabel.Layout.Row = 1;
            app.currentTopologyLabel.Layout.Column = 1;
            app.currentTopologyLabel.Text = '当前拓扑';
            app.currentTopologyLabel.HorizontalAlignment = 'right';

            app.currentTopologyDropDown = uidropdown(app.topologyLayout);
            app.currentTopologyDropDown.Layout.Row = 1;
            app.currentTopologyDropDown.Layout.Column = 2;
            app.currentTopologyDropDown.Items = {'前车跟随','双向协同','全互联','领航跟随','双向领航'};
            app.currentTopologyDropDown.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            % ctrlParam
            app.ctrlParamsPanel = uipanel(app.basicParamLayout);
            app.ctrlParamsPanel.BorderType = 'none';
            app.ctrlParamsPanel.Title = '控制参数';
            app.ctrlParamsPanel.Layout.Row = 5;
            app.ctrlParamsPanel.Layout.Column = 1;
            app.ctrlParamsPanel.FontWeight = 'bold';
            app.ctrlParamsPanel.FontSize = 14;

            app.ctrlParamsLayout = uigridlayout(app.ctrlParamsPanel);
            app.ctrlParamsLayout.ColumnWidth = {'fit', 216, 'fit', 216};
            app.ctrlParamsLayout.RowHeight = {'fit'};
            app.ctrlParamsLayout.Padding = [5 5 5 5];

            app.KpLabel = uilabel(app.ctrlParamsLayout);
            app.KpLabel.Layout.Row = 1;
            app.KpLabel.Layout.Column = 1;
            app.KpLabel.Text = '位置系数Kp';
            app.KpLabel.HorizontalAlignment = 'right';

            app.KpSpinner = uispinner(app.ctrlParamsLayout);
            app.KpSpinner.Layout.Row = 1;
            app.KpSpinner.Layout.Column = 2;
            app.KpSpinner.HorizontalAlignment = 'left';
            app.KpSpinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.KvLabel = uilabel(app.ctrlParamsLayout);
            app.KvLabel.Layout.Row = 1;
            app.KvLabel.Layout.Column = 3;
            app.KvLabel.Text = '速度系数Kv';
            app.KvLabel.HorizontalAlignment = 'right';

            app.KvSpinner = uispinner(app.ctrlParamsLayout);
            app.KvSpinner.Layout.Row = 1;
            app.KvSpinner.Layout.Column = 4;
            app.KvSpinner.HorizontalAlignment = 'left';
            app.KvSpinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            % physical
            app.physicalPanel = uipanel(app.basicParamLayout);
            app.physicalPanel.BorderType = 'none';
            app.physicalPanel.Title = '物理性质';
            app.physicalPanel.Layout.Row = 6;
            app.physicalPanel.Layout.Column = 1;
            app.physicalPanel.FontWeight = 'bold';
            app.physicalPanel.FontSize = 14;

            app.physicalLayout = uigridlayout(app.physicalPanel);
            app.physicalLayout.ColumnWidth = {'fit', 216, 'fit', 216, 'fit', 216};
            app.physicalLayout.RowHeight = {'fit', 'fit'};
            app.physicalLayout.Padding = [5 5 5 5];

            app.veloLimitLabel = uilabel(app.physicalLayout);
            app.veloLimitLabel.Layout.Row = 1;
            app.veloLimitLabel.Layout.Column = 1;
            app.veloLimitLabel.Text = '速度限幅';
            app.veloLimitLabel.HorizontalAlignment = 'right';

            app.veloLimitSpinner = uispinner(app.physicalLayout);
            app.veloLimitSpinner.Layout.Row = 1;
            app.veloLimitSpinner.Layout.Column = 2;
            app.veloLimitSpinner.HorizontalAlignment = 'left';
            app.veloLimitSpinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.ctrlLimitLabel = uilabel(app.physicalLayout);
            app.ctrlLimitLabel.Layout.Row = 1;
            app.ctrlLimitLabel.Layout.Column = 3;
            app.ctrlLimitLabel.Text = '控制输入限幅';
            app.ctrlLimitLabel.HorizontalAlignment = 'right';

            app.ctrlLimitSpinner = uispinner(app.physicalLayout);
            app.ctrlLimitSpinner.Layout.Row = 1;
            app.ctrlLimitSpinner.Layout.Column = 4;
            app.ctrlLimitSpinner.HorizontalAlignment = 'left';
            app.ctrlLimitSpinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.c0Label = uilabel(app.physicalLayout);
            app.c0Label.Layout.Row = 2;
            app.c0Label.Layout.Column = 1;
            app.c0Label.Text = '阻力系数c0';
            app.c0Label.HorizontalAlignment = 'right';

            app.c0Spinner = uispinner(app.physicalLayout);
            app.c0Spinner.Layout.Row = 2;
            app.c0Spinner.Layout.Column = 2;
            app.c0Spinner.HorizontalAlignment = 'left';
            app.c0Spinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.c1Label = uilabel(app.physicalLayout);
            app.c1Label.Layout.Row = 2;
            app.c1Label.Layout.Column = 3;
            app.c1Label.Text = '阻力系数c1';
            app.c1Label.HorizontalAlignment = 'right';

            app.c1Spinner = uispinner(app.physicalLayout);
            app.c1Spinner.Layout.Row = 2;
            app.c1Spinner.Layout.Column = 4;
            app.c1Spinner.HorizontalAlignment = 'left';
            app.c1Spinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.c2Label = uilabel(app.physicalLayout);
            app.c2Label.Layout.Row = 2;
            app.c2Label.Layout.Column = 5;
            app.c2Label.Text = '阻力系数c2';
            app.c2Label.HorizontalAlignment = 'right';

            app.c2Spinner = uispinner(app.physicalLayout);
            app.c2Spinner.Layout.Row = 2;
            app.c2Spinner.Layout.Column = 6;
            app.c2Spinner.HorizontalAlignment = 'left';
            app.c2Spinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.basicParamSaveButton = uibutton(app.basicParamLayout, 'push');
            app.basicParamSaveButton.Layout.Row = 8;
            app.basicParamSaveButton.Layout.Column = 2;
            app.basicParamSaveButton.Text = '保存';
            app.basicParamSaveButton.ButtonPushedFcn = createCallbackFcn(app,@paramSaveBtnPushed,true);

            %% advanParamLayout
            app.advanParamLayout = uigridlayout(app.mainLayout);
            app.advanParamLayout.ColumnWidth = {'fit', 'fit', '1x', 100};
            app.advanParamLayout.RowHeight = {20, '1x', '1x', '1.5x', '0.5x', 'fit'};
            app.advanParamLayout.Padding = [0 0 0 0];
            app.advanParamLayout.Layout.Row = 2;
            app.advanParamLayout.Layout.Column = 1;

            app.advanParamLabel = uilabel(app.advanParamLayout);
            app.advanParamLabel.HorizontalAlignment = 'center';
            app.advanParamLabel.Layout.Row = 1;
            app.advanParamLabel.Layout.Column = 1;
            app.advanParamLabel.Text = '启用';
            app.advanParamLabel.FontSize = 14;

            app.advanParamSwitch = uiswitch(app.advanParamLayout, 'slider');
            app.advanParamSwitch.Layout.Row = 1;
            app.advanParamSwitch.Layout.Column = 2;
            app.advanParamSwitch.ValueChangedFcn = createCallbackFcn(app,@advanSwitchValueChanged,true);

            % delay
            app.delayParamPanel = uipanel(app.advanParamLayout);
            app.delayParamPanel.BorderType = 'none';
            app.delayParamPanel.Title = '延时参数';
            app.delayParamPanel.Layout.Row = 2;
            app.delayParamPanel.Layout.Column = [1 3];
            app.delayParamPanel.FontWeight = 'bold';
            app.delayParamPanel.FontSize = 14;

            app.delayParamLayout = uigridlayout(app.delayParamPanel);
            app.delayParamLayout.ColumnWidth = {'fit', 'fit', '1x'};
            app.delayParamLayout.RowHeight = {'fit', 'fit'};
            app.delayParamLayout.Padding = [5 5 5 5];

            app.delayParamLabel = uilabel(app.delayParamLayout);
            app.delayParamLabel.HorizontalAlignment = 'center';
            app.delayParamLabel.Layout.Row = 1;
            app.delayParamLabel.Layout.Column = 1;
            app.delayParamLabel.Text = '启用';

            app.delayParamSwitch = uiswitch(app.delayParamLayout, 'slider');
            app.delayParamSwitch.Layout.Row = 1;
            app.delayParamSwitch.Layout.Column = 2;
            app.delayParamSwitch.ValueChangedFcn = createCallbackFcn(app,@delaySwitchValueChanged,true);

            app.delayLayout = uigridlayout(app.delayParamLayout);
            app.delayLayout.ColumnWidth = {'fit', '1x', 'fit', '1x', 'fit', '1x'};
            app.delayLayout.RowHeight = {'1x'};
            app.delayLayout.Padding = [0 0 0 0];
            app.delayLayout.Layout.Row = 2;
            app.delayLayout.Layout.Column = [1 3];

            app.delayModeLabel = uilabel(app.delayLayout);
            app.delayModeLabel.HorizontalAlignment = 'right';
            app.delayModeLabel.Layout.Row = 1;
            app.delayModeLabel.Layout.Column = 1;
            app.delayModeLabel.Text = '延时模式';

            app.delayModeDropDown = uidropdown(app.delayLayout);
            app.delayModeDropDown.Layout.Row = 1;
            app.delayModeDropDown.Layout.Column = 2;
            app.delayModeDropDown.Items = {'无延时补偿', '匀速预测','Smith预估器'};
            app.delayModeDropDown.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.fixDelayLabel = uilabel(app.delayLayout);
            app.fixDelayLabel.HorizontalAlignment = 'right';
            app.fixDelayLabel.Layout.Row = 1;
            app.fixDelayLabel.Layout.Column = 3;
            app.fixDelayLabel.Text = '固定延时';

            app.fixDelaySpinner = uispinner(app.delayLayout);
            app.fixDelaySpinner.Layout.Row = 1;
            app.fixDelaySpinner.Layout.Column = 4;
            app.fixDelaySpinner.HorizontalAlignment = 'left';
            app.fixDelaySpinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.flucDelayLabel = uilabel(app.delayLayout);
            app.flucDelayLabel.HorizontalAlignment = 'right';
            app.flucDelayLabel.Layout.Row = 1;
            app.flucDelayLabel.Layout.Column = 5;
            app.flucDelayLabel.Text = '波动幅度';

            app.flucDelaySpinner = uispinner(app.delayLayout);
            app.flucDelaySpinner.Layout.Row = 1;
            app.flucDelaySpinner.Layout.Column = 6;
            app.flucDelaySpinner.HorizontalAlignment = 'left';
            app.flucDelaySpinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            % noise
            app.noiseParamPanel = uipanel(app.advanParamLayout);
            app.noiseParamPanel.BorderType = 'none';
            app.noiseParamPanel.Title = '干扰参数';
            app.noiseParamPanel.Layout.Row = 3;
            app.noiseParamPanel.Layout.Column = [1 3];
            app.noiseParamPanel.FontWeight = 'bold';
            app.noiseParamPanel.FontSize = 14;

            app.noiseParamLayout = uigridlayout(app.noiseParamPanel);
            app.noiseParamLayout.ColumnWidth = {'fit', 'fit', '1x'};
            app.noiseParamLayout.RowHeight = {'fit', 'fit'};
            app.noiseParamLayout.Padding = [5 5 5 5];

            app.noiseParamLabel = uilabel(app.noiseParamLayout);
            app.noiseParamLabel.HorizontalAlignment = 'center';
            app.noiseParamLabel.Layout.Row = 1;
            app.noiseParamLabel.Layout.Column = 1;
            app.noiseParamLabel.Text = '启用';

            app.noiseParamSwitch = uiswitch(app.noiseParamLayout, 'slider');
            app.noiseParamSwitch.Layout.Row = 1;
            app.noiseParamSwitch.Layout.Column = 2;
            app.noiseParamSwitch.ValueChangedFcn = createCallbackFcn(app,@noiseSwitchValueChanged,true);

            app.noiseLayout = uigridlayout(app.noiseParamLayout);
            app.noiseLayout.ColumnWidth = {'fit', '1x', 'fit', '1x', 'fit', '1x', 'fit', '1x'};
            app.noiseLayout.RowHeight = {'1x'};
            app.noiseLayout.Padding = [0 0 0 0];
            app.noiseLayout.Layout.Row = 2;
            app.noiseLayout.Layout.Column = [1 3];

            app.noiseModeLabel = uilabel(app.noiseLayout);
            app.noiseModeLabel.HorizontalAlignment = 'right';
            app.noiseModeLabel.Layout.Row = 1;
            app.noiseModeLabel.Layout.Column = 1;
            app.noiseModeLabel.Text = '干扰模式';

            app.noiseModeDropDown = uidropdown(app.noiseLayout);
            app.noiseModeDropDown.Layout.Row = 1;
            app.noiseModeDropDown.Layout.Column = 2;
            app.noiseModeDropDown.Items = {'无干扰补偿','干扰观测器'};
            app.noiseModeDropDown.ValueChangedFcn = createCallbackFcn(app,@noiseModeValueChanged,true);

            app.frictionNoiseLabel = uilabel(app.noiseLayout);
            app.frictionNoiseLabel.HorizontalAlignment = 'right';
            app.frictionNoiseLabel.Layout.Row = 1;
            app.frictionNoiseLabel.Layout.Column = 3;
            app.frictionNoiseLabel.Text = '阻力干扰';

            app.frictionNoiseSpinner = uispinner(app.noiseLayout);
            app.frictionNoiseSpinner.Layout.Row = 1;
            app.frictionNoiseSpinner.Layout.Column = 4;
            app.frictionNoiseSpinner.HorizontalAlignment = 'left';
            app.frictionNoiseSpinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.elecNoiseLabel = uilabel(app.noiseLayout);
            app.elecNoiseLabel.HorizontalAlignment = 'right';
            app.elecNoiseLabel.Layout.Row = 1;
            app.elecNoiseLabel.Layout.Column = 5;
            app.elecNoiseLabel.Text = '牵引电信号干扰';

            app.elecNoiseSpinner = uispinner(app.noiseLayout);
            app.elecNoiseSpinner.Layout.Row = 1;
            app.elecNoiseSpinner.Layout.Column = 6;
            app.elecNoiseSpinner.HorizontalAlignment = 'left';
            app.elecNoiseSpinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            app.alphaLabel = uilabel(app.noiseLayout);
            app.alphaLabel.HorizontalAlignment = 'right';
            app.alphaLabel.Layout.Row = 1;
            app.alphaLabel.Layout.Column = 7;
            app.alphaLabel.Text = '低通滤波系数';

            app.alphaSpinner = uispinner(app.noiseLayout);
            app.alphaSpinner.Layout.Row = 1;
            app.alphaSpinner.Layout.Column = 8;
            app.alphaSpinner.HorizontalAlignment = 'left';
            app.alphaSpinner.ValueChangedFcn = createCallbackFcn(app,@paramValueChanged,true);

            % energy
            app.energyParamPanel = uipanel(app.advanParamLayout);
            app.energyParamPanel.BorderType = 'none';
            app.energyParamPanel.Title = '能耗参数';
            app.energyParamPanel.Layout.Row = 4;
            app.energyParamPanel.Layout.Column = [1 3];
            app.energyParamPanel.FontWeight = 'bold';
            app.energyParamPanel.FontSize = 14;

            app.energyParamLayout = uigridlayout(app.energyParamPanel);
            app.energyParamLayout.ColumnWidth = {'fit', 'fit', '1x'};
            app.energyParamLayout.RowHeight = {'fit', '1x'};
            app.energyParamLayout.Padding = [5 5 5 5];

            app.energyParamLabel = uilabel(app.energyParamLayout);
            app.energyParamLabel.HorizontalAlignment = 'center';
            app.energyParamLabel.Layout.Row = 1;
            app.energyParamLabel.Layout.Column = 1;
            app.energyParamLabel.Text = '启用';

            app.energyParamSwitch = uiswitch(app.energyParamLayout, 'slider');
            app.energyParamSwitch.Layout.Row = 1;
            app.energyParamSwitch.Layout.Column = 2;
            app.energyParamSwitch.ValueChangedFcn = createCallbackFcn(app,@energySwitchValueChanged,true);

            app.energyLayout = uigridlayout(app.energyParamLayout);
            app.energyLayout.ColumnWidth = {'fit', '1x'};
            app.energyLayout.RowHeight = {'1x'};
            app.energyLayout.Padding = [0 0 0 0];
            app.energyLayout.Layout.Row = 2;
            app.energyLayout.Layout.Column = [1 3];

            app.energyRealtimeLabel = uilabel(app.energyLayout);
            app.energyRealtimeLabel.HorizontalAlignment = 'right';
            app.energyRealtimeLabel.Layout.Row = 1;
            app.energyRealtimeLabel.Layout.Column = 1;
            app.energyRealtimeLabel.Text = '能耗统计';

            app.energyRealtimeTextArea = uitextarea(app.energyLayout);
            app.energyRealtimeTextArea.Layout.Row = 1;
            app.energyRealtimeTextArea.Layout.Column = 2;
            app.energyRealtimeTextArea.Editable = "off";

            app.advanParamSaveButton = uibutton(app.advanParamLayout, 'push');
            app.advanParamSaveButton.Layout.Row = 6;
            app.advanParamSaveButton.Layout.Column = 4;
            app.advanParamSaveButton.Text = '保存';
            app.advanParamSaveButton.ButtonPushedFcn = createCallbackFcn(app,@paramSaveBtnPushed,true);

            %% visualLayout
            app.visualLayout = uigridlayout(app.mainLayout);
            app.visualLayout.RowHeight = {'1x', '1x', '1x'};
            app.visualLayout.ColumnWidth = {'1x','1x'};
            app.visualLayout.RowSpacing = 4;
            app.visualLayout.ColumnSpacing = 4;
            app.visualLayout.Padding = [4 4 4 4];
            app.visualLayout.Layout.Row = 2;
            app.visualLayout.Layout.Column = 1;

            app.animeAxes = uiaxes(app.visualLayout);
            title(app.animeAxes, '列车运行动画')
            xlabel(app.animeAxes, '位置')
            app.animeAxes.Layout.Row = 1;
            app.animeAxes.Layout.Column = [1 2];
            ylim(app.animeAxes,[-20 60]);

            app.positionAxes = uiaxes(app.visualLayout);
            title(app.positionAxes, '位置曲线')
            xlabel(app.positionAxes, '时间')
            ylabel(app.positionAxes, '位置')
            app.positionAxes.Layout.Row = 2;
            app.positionAxes.Layout.Column = 1;

            app.velocityAxes = uiaxes(app.visualLayout);
            title(app.velocityAxes, '速度曲线')
            xlabel(app.velocityAxes, '时间')
            ylabel(app.velocityAxes, '速度')
            app.velocityAxes.Layout.Row = 2;
            app.velocityAxes.Layout.Column = 2;

            app.errorAxes = uiaxes(app.visualLayout);
            title(app.errorAxes, '间距误差曲线')
            xlabel(app.errorAxes, '时间')
            ylabel(app.errorAxes, '间距误差')
            app.errorAxes.Layout.Row = 3;
            app.errorAxes.Layout.Column = 1;

            app.controlInputAxes = uiaxes(app.visualLayout);
            title(app.controlInputAxes, '控制输入曲线')
            xlabel(app.controlInputAxes, '时间')
            ylabel(app.controlInputAxes, '控制输入')
            app.controlInputAxes.Layout.Row = 3;
            app.controlInputAxes.Layout.Column = 2;

            %% historyLayout
            app.historyLayout = uigridlayout(app.mainLayout);
            app.historyLayout.ColumnWidth = {'1x'};
            app.historyLayout.RowHeight = {'1x'};
            app.historyLayout.Padding = [0 0 0 0];
            app.historyLayout.Layout.Row = 2;
            app.historyLayout.Layout.Column = 1;

            app.historyTable = uitable(app.historyLayout);
            app.historyTable.ColumnName = {'Column 1'; 'Column 2'; 'Column 3'; 'Column 4'};
            app.historyTable.RowName = {};
            app.historyTable.Layout.Row = 1;
            app.historyTable.Layout.Column = 1;

            %% aboutLayout
            app.aboutLayout = uigridlayout(app.mainPanel);

        end

        function setPanel(app, panelname)
            if ~app.isParamSaved
                uialert(app.uiFigure,'参数未保存，请先保存参数!','错误');
                return;
            end

            % 隐藏 mainPanel
            app.mainLayout.Visible = "off";
            app.aboutLayout.Visible = "off";

            % 隐藏 mainLayout
            app.selectLayout.Visible = "off";
            app.basicParamLayout.Visible = "off";
            app.advanParamLayout.Visible = "off";
            app.visualLayout.Visible = "off";
            app.historyLayout.Visible = "off";
 
            % 隐藏 selectLayout
            app.selectLayout.ColumnWidth{1}=0;
            app.selectLayout.ColumnWidth{2}=0;
            app.selectLayout.ColumnWidth{3}=0;
            app.selectLayout.ColumnWidth{4}=0;

            % 禁用后四个 toolbar 按钮
            app.paramsAddButton.Enable = "off";
            app.paramsDeleteButton.Enable = "off";
            app.accountImportButton.Enable = "off";
            app.dataExportButton.Enable = "off";

            switch panelname
                case '基本参数'
                    app.paramsAddButton.Enable = "on";
                    app.paramsDeleteButton.Enable = "on";

                    app.selectLayout.ColumnWidth{1}='fit';
                    app.selectLayout.ColumnWidth{2}='1x';
                    app.selectLayout.Visible = "on";

                    app.basicParamLayout.Visible = "on";

                    app.mainLayout.Visible = "on";

                case '高级参数'   
                    app.paramsAddButton.Enable = "on";
                    app.paramsDeleteButton.Enable = "on";

                    app.selectLayout.ColumnWidth{1}='fit';
                    app.selectLayout.ColumnWidth{2}='1x';
                    app.selectLayout.Visible = "on";

                    app.advanParamLayout.Visible = "on";

                    app.mainLayout.Visible = "on";

                case '可视化'
                    app.selectLayout.ColumnWidth{1}='fit';
                    app.selectLayout.ColumnWidth{2}='1x';
                    app.selectLayout.Visible = "on";

                    app.visualLayout.Visible = "on";

                    app.mainLayout.Visible = "on";

                case '历史数据'
                    app.dataExportButton.Enable = "on";

                    app.selectLayout.ColumnWidth{3}='fit';
                    app.selectLayout.ColumnWidth{4}='1x';
                    app.selectLayout.Visible = "on";

                    app.historyLayout.Visible = "on";

                    app.mainLayout.Visible = "on";
                    
                case '关于'
                    app.accountImportButton.Enable = "on"; 
                    
                    app.aboutLayout.Visible = "on";
                otherwise

            end

            app.mainPanel.Title = panelname;
            app.m_currentPanel = panelname;   
        end

        function setStatus(app, status)
            % 禁用toolbar控制按钮
            app.startButton.Enable = "off";
            app.pauseButton.Enable = "off";
            app.continueButton.Enable = "off";
            app.resultButton.Enable = "off";
            app.replayButton.Enable = "off";

            switch app.m_currentScenario
                case 'teaching'

                    switch status
                        case '准备就绪'
                            app.startButton.Enable = "on";
                            app.replayButton.Enable = "on";

                            app.statusLamp.Color = [0.2314 0.6667 0.1961];
                        case '正在运行'   
                            app.pauseButton.Enable = "on"; 
                            app.resultButton.Enable = "on";

                            app.statusLamp.Color = [0.8667 0.3294 0];
                        case '回放中'
                            app.resultButton.Enable = "on";

                            app.statusLamp.Color = [0.0667 0.4431 0.7451];
                        case '已暂停'   
                            app.continueButton.Enable = "on";
                            app.resultButton.Enable = "on";

                            app.statusLamp.Color = [0.9294 0.6902 0.1294];
                        otherwise
                            
                    end
                case 'research'    
                    switch status
                        case '准备就绪'
                            app.resultButton.Enable = "on";
                            app.replayButton.Enable = "on";

                            app.statusLamp.Color = [0.2314 0.6667 0.1961];
                            
                        case '正在运行'    
                            app.statusLamp.Color = [0.8667 0.3294 0];

                        case '回放中'
                            app.resultButton.Enable = "on";

                            app.statusLamp.Color = [0.0667 0.4431 0.7451];
                        otherwise   
                    end
                otherwise   
                    switch status
                        case '准备就绪'
                            app.statusLamp.Color = [0.2314 0.6667 0.1961];
                        case '正在运行'    
                            app.statusLamp.Color = [0.8667 0.3294 0];
                        case '回放中'
                            app.statusLamp.Color = [0.0667 0.4431 0.7451];
                        case '已暂停'   
                            app.statusLamp.Color = [0.9294 0.6902 0.1294];
                        otherwise   
                    end  
            end

            app.statusLabel.Text = status;
            app.m_currentStatus = status;
        end

        function initData(app)
            app.m_lastError = '';
            app.m_lastResult = {};
            
            app.m_animeRectangles = [];
            app.m_positionLines = [];
            app.m_velocityLines = [];
            app.m_errorLines = [];
            app.m_controlInputLines = [];
            app.m_stepNumGone = 0;


            % 基本参数 高级参数
            app.currentParamsDropDown.Items = app.m_jsonHelper.m_paramsNameList; % 读取本地所有参数集名
            app.currentParamsDropDown.Value = 'default';
            currentParamsValueChanged(app); % 手动调用
            app.energyRealtimeTextArea.Value = '';

            % 可视化
            cla(app.animeAxes);
            cla(app.positionAxes);
            cla(app.velocityAxes);
            cla(app.errorAxes);
            cla(app.controlInputAxes);

            box(app.animeAxes,"on");
            box(app.positionAxes,"on");
            box(app.velocityAxes,"on");
            box(app.errorAxes,"on");
            box(app.controlInputAxes,"on");

            legend(app.positionAxes,'off');
            legend(app.velocityAxes,'off');
            legend(app.errorAxes,'off');
            legend(app.controlInputAxes,'off');

            % 历史数据
        end

        function calculateResult(app)
            %% 基本参数
            % 仿真基础参数
            frequency = app.frequencySpinner.Value;
            totalTime = app.totalTimeSpinner.Value;
            timeVector = 0:frequency:totalTime;
            stepNum = length(timeVector);

            % 列车参数
            trainNum = app.trainNumSpinner.Value;
            trainLength = app.trainLengthSpinner.Value;
            trainSpacing = app.trainSpacingSpinner.Value;
            leaderGaps = zeros(trainNum,1);
            for i = 1:trainNum
                leaderGaps(i) = -(i-1)*(trainSpacing+trainLength);
            end
            startPosi = app.startPosiEditField.Value;
            startVelo = app.startVeloEditField.Value;

            % 初始化各状态
            position = zeros(trainNum,stepNum);
            velocity = zeros(trainNum,stepNum);
            spacingError = zeros(trainNum,stepNum);
            controlInput = zeros(trainNum,stepNum);
            acceleration = zeros(trainNum,stepNum);
            position(:,1) = str2double(split(startPosi, ',')); % 初始位置
            velocity(:,1) = str2double(split(startVelo, ',')); % 初始速度

            % 领航车轨迹设计
            trajDesign = app.trajDesignDropDown.Value;
            trajPosi = app.trajPosiEditField.Value;
            trajVelo = app.trajVeloEditField.Value;
            if strcmp(trajDesign,'按速度')
                % 计算领航车速度轨迹
                leaderStartVelo = velocity(1,1);
                leaderVeloArr = leaderStartVelo*ones(1,stepNum);
                pairsCell = strsplit(trajVelo, ';'); 
                for i = 1:numel(pairsCell)
                    pairCell= split(pairsCell(i),',');
                    time =str2double(pairCell{1}(2:end));
                    step = round(time/frequency);
                    velo = str2double(pairCell{2});
                    leaderVeloArr(step:stepNum) = velo;
                end

                % 设置领航车轨迹
                for i = 2:stepNum
                    position(1,i) = position(1,i-1)+leaderVeloArr(i-1)*frequency; 
                    velocity(1,i) = leaderVeloArr(i);
                    acceleration(1,i) = round((velocity(1,i)-velocity(1,i-1))/frequency);
                end

            elseif strcmp(trajDesign,'按位置')
                % 计算领航车位置轨迹
                leaderStartPosi = position(1,1);
                leaderPosiArr = leaderStartPosi*ones(1,stepNum);
                pairsCell = strsplit(trajPosi, ';');
                timeKeydots = zeros(numel(pairsCell) + 1, 1);
                posiKeydots = zeros(numel(pairsCell) + 1, 1);
                timeKeydots(1) = 0;
                posiKeydots(1) = leaderStartPosi; 

                % 分离出关键点对应时间和位置
                for i = 1:numel(pairsCell)
                    pairCell= split(pairsCell(i),',');
                    time = str2double(pairCell{1}(2:end));
                    posi = str2double(pairCell{2});
                    timeKeydots(i+1) = time;
                    posiKeydots(i+1) = posi;
                end

                % 根据关键点拟合出领航车位置曲线
                for i = 1:stepNum
                    currentTime = timeVector(i);
                    if currentTime<=timeKeydots(end)
                        leaderPosiArr(i) = interp1(timeKeydots, posiKeydots, currentTime, 'makima', 'extrap');
                    else
                        leaderPosiArr(i) = posiKeydots(end);
                    end             
                end

                % 设置领航车轨迹
                for i = 2:stepNum
                    position(1,i) = round(leaderPosiArr(i),1);
                    velocity(1,i) = round((leaderPosiArr(i)-leaderPosiArr(i-1))/frequency,1);
                    acceleration(1,i) = round((velocity(1,i)-velocity(1,i-1))/frequency);
                end

            end     
            
            % 通信拓扑
            topology = app.currentTopologyDropDown.Value;
            A = zeros(trainNum,trainNum);
            switch topology
                case '前车跟随'
                    for i = 2:trainNum
                        A(i, i-1) = 1;
                    end
                case '双向协同'
                    for i = 2:trainNum-1
                        A(i, i-1) = 1; % 看前
                        A(i, i+1) = 1; % 看后
                    end
                    A(trainNum, trainNum-1) = 1; % 最后一辆只看前
                case '全互联'
                    for i = 2:trainNum
                         A(i, i-1) = 1; % 看前车
                         A(i, 1) = 1;   % 都能直接看领航车
                    end
                case '领航跟随'
                    for i = 2:trainNum
                        A(i, 1) = 1;   % 都能直接看领航车
                    end
                case '双向领航'   
                    for i = 2:trainNum-1
                        A(i, i-1) = 1; % 看前
                        A(i, i+1) = 1; % 看后
                        A(i, 1) = 1;   % 都能直接看领航车
                    end
                    A(trainNum, trainNum-1) = 1; % 最后一辆只看前
                    A(trainNum, 1) = 1;   % 都能直接看领航车              
                otherwise            
            end

            % 控制参数
            Kp = app.KpSpinner.Value;
            Kv = app.KvSpinner.Value;

            % 物理性质
            veloLimit = app.veloLimitSpinner.Value;
            ctrlLimit = app.ctrlLimitSpinner.Value;
            c0 = app.c0Spinner.Value;
            c1 = app.c1Spinner.Value;
            c2 = app.c2Spinner.Value; 

            %% 高级参数
            advanSwitch = app.advanParamSwitch.Value;
            isAdvan = false;
            if strcmp(advanSwitch,'On')
                isAdvan = true;
            end     

            rng(0);
            % 延时参数
            delaySwitch = app.delayParamSwitch.Value;
            isDelay = false;
            if strcmp(delaySwitch,'On')
                isDelay = true;
            end  

            delayMode = 0;
            switch app.delayModeDropDown.Value
                case '无延时补偿'
                    delayMode = 0;
                case '匀速预测'
                    delayMode = 1;
                case 'Smith预估器'
                    delayMode = 2;    
                otherwise
            end
            
            fixDelay = app.fixDelaySpinner.Value;
            flucDelay = app.flucDelaySpinner.Value;
            if fixDelay == 0
                flucDelay = 0;
            end    
            if flucDelay > 10*frequency
                flucDelay = 10*frequency;
            end    
            fixDelayStep = round(fixDelay/frequency);
            flucDelayStep = round(flucDelay/frequency);

            delaySteps = zeros(trainNum,stepNum);
            if flucDelayStep == 0
                % 固定延时
                for i=2:trainNum
                    delaySteps(i,:) = fixDelayStep;
                end       
            else
                % 波动延时
                randFlucStep = randi([-flucDelayStep,flucDelayStep],trainNum,stepNum);
                for i=2:trainNum
                    delaySteps(i,:) = max(0, fixDelayStep + randFlucStep(i,:));   
                end  
            end

            % 干扰参数
            noiseSwitch = app.noiseParamSwitch.Value;
            isNoise = false;
            if strcmp(noiseSwitch,'On')
                isNoise = true;
            end   
            
            noiseMode = 0;
            if app.noiseModeDropDown.Value == '干扰观测器'
                noiseMode = 1;
            end    

            frictionNoise = app.frictionNoiseSpinner.Value;
            elecNoise = app.elecNoiseSpinner.Value;
            noises = zeros(trainNum,stepNum);
            noises(:,:) = randi([0 frictionNoise],trainNum,stepNum) + randi([-elecNoise elecNoise],trainNum,stepNum);

            alpha = app.alphaSpinner.Value;         % 低通滤波系数（0 < alpha <= 1，越小滤波越强）
            noisesEsti = zeros(trainNum, stepNum);  % 扰动估计值

            % 能耗参数
            energySwitch = app.energyParamSwitch.Value;
            isEnergy = false;
            if strcmp(energySwitch,'On')
                isEnergy = true;
            end    

            % 教学用户直接禁止高级参数
            if app.m_currentScenario == 'teaching'
                isAdvan = false;
            end

            %% 仿真循环 遍历每一步
            for stepIdx = 1:stepNum-1
                % 遍历跟随车
                for followIdx = 2:trainNum
                    posiErr = 0;
                    veloErr = 0;

                    % 遍历该跟随车对应交互车
                    for interactIdx = 1:trainNum
                        if A(followIdx,interactIdx) == 1

                            x_interactRead = 0;
                            v_interactRead = 0;
                            if isAdvan&&isDelay
                                % 有延时 延时获取到的对应原本的实际步数
                                d = delaySteps(followIdx, stepIdx);
                                delayPrevStep = max(1, stepIdx - d);

                                switch delayMode
                                    case 0
                                        % 不补偿
                                        x_interactRead = position(interactIdx,delayPrevStep);
                                        v_interactRead = velocity(interactIdx,delayPrevStep);
                                    case 1
                                        % 匀速预测 从原本的步数补偿到现在的仿真步数 认为交互车在未知的时间里一直匀速
                                        x_interactRead = position(interactIdx,delayPrevStep) + velocity(interactIdx,delayPrevStep)*d*frequency;
                                        v_interactRead = velocity(interactIdx,delayPrevStep);
                                    case 2    
                                        % Smith预估器 计算原本的实际时刻及前2步的加速度
                                        a = 0;
                                        if delayPrevStep >= 3
                                            x_1 = position(interactIdx,delayPrevStep-2);
                                            x_2 = position(interactIdx,delayPrevStep-1);
                                            x_3 = position(interactIdx,delayPrevStep);
                                            a = (x_1 - 2*x_2 + x_3) / (frequency^2);
                                        end    

                                        % 匀加速预测
                                        x_interactPrev = position(interactIdx,delayPrevStep);
                                        v_interactPrev = velocity(interactIdx,delayPrevStep);
                                        delay = d*frequency;
                                        x_interactRead = x_interactPrev + v_interactPrev*delay + 0.5*a*(delay^2);
                                        v_interactRead = v_interactPrev + a*delay;
                                        
                                end
                            else
                                % 无延时
                                x_interactRead = position(interactIdx,stepIdx);
                                v_interactRead = velocity(interactIdx,stepIdx);
                            end        

                            % 位置误差 = 实际车距 - 期望车距 =  (邻车实际位置 - 跟随车实际位置）- (邻车期望位置 - 跟随车期望位置)
                            nowSpacing = x_interactRead - position(followIdx,stepIdx);
                            expSpacing = leaderGaps(interactIdx) - leaderGaps(followIdx);
                            currentPosiErr = nowSpacing - expSpacing;

                            % 速度偏差 = 预测的交互车速度 - 当前跟随车速度
                            currentVeloErr = v_interactRead - velocity(followIdx,stepIdx);

                            % 累计偏差
                            posiErr = posiErr + currentPosiErr;
                            veloErr = veloErr + currentVeloErr;  
                        end    
                    end 

                    % 计算控制输入
                    ctrl_actual = 0;
                    if isAdvan&&isNoise
                        % 有干扰
                        if noiseMode == 1
                            % 有补偿 计算干扰观测器估计
                            if stepIdx > 1
                                % 计算实际加速度（从 stepIdx-1 到 stepIdx）
                                accel_actual = (velocity(followIdx, stepIdx) - velocity(followIdx, stepIdx-1)) / frequency;
                                % 原始扰动观测值 = 实际加速度 - 上一时刻施加的控制量
                                noiseRaw = accel_actual - controlInput(followIdx, stepIdx-1);
                                % 一阶低通滤波更新扰动估计
                                noisesEsti(followIdx, stepIdx) = (1-alpha) * noisesEsti(followIdx, stepIdx-1) + alpha * noiseRaw;
                            end

                            ctrl_NoDob = Kp*posiErr + Kv*veloErr  + noises(followIdx,stepIdx);
                            % 实际补偿后需要的控制输入 = 有扰动控制输入 - 估计扰动
                            ctrl_actual = ctrl_NoDob - noisesEsti(followIdx, stepIdx);

                        else
                            % 无补偿
                            ctrl_actual = Kp*posiErr + Kv*veloErr + noises(followIdx,stepIdx);
                        end       
                    else
                        % 无干扰
                        ctrl_actual = Kp*posiErr + Kv*veloErr;
                    end        

                    % 控制输入限幅
                    if ctrl_actual > ctrlLimit
                        controlInput(followIdx,stepIdx) = ctrlLimit;
                    elseif ctrl_actual < -ctrlLimit
                        controlInput(followIdx,stepIdx) = -ctrlLimit;
                    else
                        controlInput(followIdx,stepIdx) = ctrl_actual;
                    end

                    % 计算加速度
                    acceleration(followIdx,stepIdx) = controlInput(followIdx,stepIdx) - c0 - c1*(velocity(followIdx,stepIdx)) - c2*((velocity(followIdx,stepIdx))^2);

                    % 计算速度
                    velo_actual = velocity(followIdx,stepIdx) + acceleration(followIdx,stepIdx)*frequency;
                    
                    % 速度限幅
                    if velo_actual > veloLimit
                        velocity(followIdx,stepIdx+1) = veloLimit;
                    elseif velo_actual < -veloLimit
                        velocity(followIdx,stepIdx+1) = -veloLimit;
                    else
                        velocity(followIdx,stepIdx+1) = velo_actual;    
                    end

                    % 计算位置
                    position(followIdx,stepIdx+1) = position(followIdx,stepIdx) + velocity(followIdx,stepIdx+1)*frequency + 0.5*acceleration(followIdx,stepIdx)*(frequency^2);
                end 
            end

            % 计算error
            for trainIndex = 2:trainNum
                % 计算跟踪误差：实际位置 - (领航车位置 + 期望偏移)
                spacingError(trainIndex,:) = position(trainIndex,:) - (position(1,:) + leaderGaps(trainIndex));
            end

            % 计算每步显示的实现能耗
            energy = zeros(trainNum,stepNum);
            realtimeEnergyChars = strings(1, stepNum);
            if isAdvan&&isEnergy
                % 有能耗统计 计算每步累计能耗
                for follweIdx = 2:trainNum
                    energy(follweIdx,1) = (controlInput(follweIdx,1)^2)*frequency;
                    for stepIdx = 1:stepNum-1
                        energy(follweIdx,stepIdx+1) = energy(follweIdx,stepIdx) + ((controlInput(follweIdx,stepIdx+1)^2)*frequency);
                    end
                end

                % 计算实时能耗
                for stepIdx = 1:stepNum
                    for trainIdx = 2:trainNum
                        realtimeEnergyChars(stepIdx) = realtimeEnergyChars(stepIdx) + sprintf("跟随车 %d 能耗: %.2f\t(m²/s³)\n",trainIdx, energy(trainIdx,stepIdx));
                    end
                end

            end        

            app.m_lastResult = {position,velocity,spacingError,controlInput,timeVector,trainLength,energy,realtimeEnergyChars};

        end    

        function drawResult(app)

            position = app.m_lastResult{1};
            velocity = app.m_lastResult{2};
            spacingError = app.m_lastResult{3};
            controlInput = app.m_lastResult{4};
            timeVector = app.m_lastResult{5};
            trainLength = app.m_lastResult{6};
            [trainNum, stepNum] = size(position);

            for trainIndex = 1:trainNum
                pos = [(position(trainIndex,stepNum)-trainLength),0,trainLength,5];
                app.m_animeRectangles(trainIndex).Position = pos;

                app.m_positionLines(trainIndex).XData = timeVector;
                app.m_positionLines(trainIndex).YData = position(trainIndex,1:stepNum); 
                
                app.m_velocityLines(trainIndex).XData = timeVector;
                app.m_velocityLines(trainIndex).YData = velocity(trainIndex,1:stepNum);
                
                if trainIndex > 1
                    app.m_errorLines(trainIndex).XData = timeVector;
                    app.m_errorLines(trainIndex).YData = spacingError(trainIndex,1:stepNum);
                
                    app.m_controlInputLines(trainIndex).XData = timeVector;
                    app.m_controlInputLines(trainIndex).YData = controlInput(trainIndex,1:stepNum);
                end    
            end

            legend(app.positionAxes,["Leader", "Follower " + string(2:trainNum)],'Location','best');
            legend(app.velocityAxes,["Leader", "Follower " + string(2:trainNum)],'Location','best');
            legend(app.errorAxes,["Follower " + string(2:trainNum)],'Location','best');
            legend(app.controlInputAxes,["Follower " + string(2:trainNum)],'Location','best');


        end    

        function logoutBtnPushed(app,event)
            choice = uiconfirm(app.uiFigure,'确定要注销账户返回登录页面吗?','退出登录',"Options",["确定退出","我再想想"],"DefaultOption",2,"CancelOption",2);
            if strcmp (choice, '确定退出')
                notify(app,'Logout');
            end
        end

        function closeRequest(app, event)
            choice = uiconfirm(app.uiFigure,'确定要直接退出系统吗?','退出系统',"Options",["确定退出","我再想想"],"DefaultOption",2,"CancelOption",2);
            if strcmp (choice, '确定退出')
                notify(app,'Exit');
            end
        end

        function currentParamsValueChanged(app,event)
            paramsName = app.currentParamsDropDown.Value;
            paramsStruct = app.m_jsonHelper.getParamsStruct(paramsName);

            basicParamStruct = paramsStruct.basicParam;
            simulBasisStruct = basicParamStruct.simulBasis;
            trainParamStruct = basicParamStruct.trainParam;
            leaderTrajStruct = basicParamStruct.leaderTraj;
            ctrlParamStruct = basicParamStruct.ctrlParam;
            physicalStruct = basicParamStruct.physical;
            
            app.frequencySpinner.Value = simulBasisStruct.frequency;
            app.totalTimeSpinner.Value = simulBasisStruct.totalTime;

            app.trainNumSpinner.Value = trainParamStruct.trainNum;
            app.trainLengthSpinner.Value = trainParamStruct.trainLength;
            app.trainSpacingSpinner.Value = trainParamStruct.trainSpacing;
            app.startPosiEditField.Value = join(string(trainParamStruct.startPosi),',');
            app.startVeloEditField.Value = join(string(trainParamStruct.startVelo),',');
            
            trajDesign = leaderTrajStruct.trajDesign;
            app.trajDesignDropDown.Value = trajDesign;
            if strcmp(trajDesign,'按速度')
                app.trajPosiLabel.Enable = "off";
                app.trajPosiEditField.Enable = "off";
                app.trajPosiEditField.Editable = "off";
                app.trajVeloLabel.Enable = "on";
                app.trajVeloEditField.Enable = "on";
                app.trajVeloEditField.Editable = "on";
            elseif strcmp(trajDesign,'按位置')
                app.trajVeloLabel.Enable = "off";
                app.trajVeloEditField.Enable = "off";
                app.trajVeloEditField.Editable = "off";
                app.trajPosiLabel.Enable = "on";
                app.trajPosiEditField.Enable = "on";
                app.trajPosiEditField.Editable = "on";
            end

            trajPosi = leaderTrajStruct.trajPosi;
            trajVelo = leaderTrajStruct.trajVelo;
            app.trajPosiEditField.Value = join(strcat(fieldnames(trajPosi),',',string(struct2cell(trajPosi))),';');
            app.trajVeloEditField.Value = join(strcat(fieldnames(trajVelo),',',string(struct2cell(trajVelo))),';');
            
            app.currentTopologyDropDown.Value = basicParamStruct.topology;

            app.KpSpinner.Value = ctrlParamStruct.Kp;
            app.KvSpinner.Value = ctrlParamStruct.Kv;

            app.veloLimitSpinner.Value = physicalStruct.veloLimit;
            app.ctrlLimitSpinner.Value = physicalStruct.ctrlLimit;
            app.c0Spinner.Value = physicalStruct.c0;
            app.c1Spinner.Value = physicalStruct.c1;
            app.c2Spinner.Value = physicalStruct.c2;

            advanParamStruct = paramsStruct.advanParam;
            delayStruct = advanParamStruct.delayParam;
            noiseStruct = advanParamStruct.noiseParam;
            energyStruct = advanParamStruct.energyParam;

            if advanParamStruct.enable
                app.advanParamSwitch.Value = 'On';
            else
                app.advanParamSwitch.Value = 'Off';
            end

            if delayStruct.enable
                app.delayParamSwitch.Value = 'On';
            else
                app.delayParamSwitch.Value = 'Off';
            end
            app.delayModeDropDown.Value = delayStruct.delayMode;        
            app.fixDelaySpinner.Value = delayStruct.fixDelay;
            app.flucDelaySpinner.Value = delayStruct.flucDelay;

            if noiseStruct.enable
                app.noiseParamSwitch.Value = 'On';
            else
                app.noiseParamSwitch.Value = 'Off';
            end
            app.noiseModeDropDown.Value = noiseStruct.noiseMode;
            noiseMode = app.noiseModeDropDown.Value;
            if strcmp(noiseMode,'无干扰补偿')
                app.alphaLabel.Enable = "off";
                app.alphaSpinner.Enable = "off";
            elseif strcmp(noiseMode,'干扰观测器')
                app.alphaLabel.Enable = "on";
                app.alphaSpinner.Enable = "on";
            end  
            app.frictionNoiseSpinner.Value = noiseStruct.frictionNoise;
            app.elecNoiseSpinner.Value = noiseStruct.elecNoise;
            app.alphaSpinner.Value = noiseStruct.alpha;
            
            if energyStruct.enable
                app.energyParamSwitch.Value = 'On';
            else
                app.energyParamSwitch.Value = 'Off';
            end        

            
        end 
 
        function paramValueChanged(app,event)
            app.isParamSaved = false;
            app.uiFigure.Name = '多列车协同控制系统仿真平台* [未保存]';
        end    
        
        function trajDesignValueChanged(app,event)
            paramValueChanged(app);

            value = app.trajDesignDropDown.Value;
            if strcmp(value,'按速度')
                app.trajPosiLabel.Enable = "off";
                app.trajPosiEditField.Enable = "off";
                app.trajPosiEditField.Editable = "off";
                app.trajVeloLabel.Enable = "on";
                app.trajVeloEditField.Enable = "on";
                app.trajVeloEditField.Editable = "on";
            elseif strcmp(value,'按位置')
                app.trajVeloLabel.Enable = "off";
                app.trajVeloEditField.Enable = "off";
                app.trajVeloEditField.Editable = "off";
                app.trajPosiLabel.Enable = "on";
                app.trajPosiEditField.Enable = "on";
                app.trajPosiEditField.Editable = "on";
            end
            
        end    

        function paramSaveBtnPushed(app,event)
            app.isParamSaved = true;
            app.uiFigure.Name = '多列车协同控制系统仿真平台';

            paramsName = app.currentParamsDropDown.Value;
            basic_frequency = app.frequencySpinner.Value;
            basic_totalTime = app.totalTimeSpinner.Value;
            basic_trainNum = app.trainNumSpinner.Value;
            basic_trainLength = app.trainLengthSpinner.Value;
            basic_trainSpacing = app.trainSpacingSpinner.Value;
            basic_startPosi = app.startPosiEditField.Value;
            basic_startVelo = app.startVeloEditField.Value;
            basic_trajDesign = app.trajDesignDropDown.Value;
            basic_trajPosi = app.trajPosiEditField.Value;
            basic_trajVelo = app.trajVeloEditField.Value;
            basic_topology = app.currentTopologyDropDown.Value;
            basic_Kp = app.KpSpinner.Value;
            basic_Kv = app.KvSpinner.Value;
            basic_veloLimit = app.veloLimitSpinner.Value;
            basic_ctrlLimit = app.ctrlLimitSpinner.Value;
            basic_c0 = app.c0Spinner.Value;
            basic_c1 = app.c1Spinner.Value;
            basic_c2 = app.c2Spinner.Value;
            advan_switch = app.advanParamSwitch.Value;
            advan_delaySwitch = app.delayParamSwitch.Value;
            advan_delayMode = app.delayModeDropDown.Value;
            advan_fixDelay = app.fixDelaySpinner.Value;
            advan_flucDelay = app.flucDelaySpinner.Value;
            advan_noiseSwitch = app.noiseParamSwitch.Value;
            advan_noiseMode = app.noiseModeDropDown.Value;
            advan_frictionNoise = app.frictionNoiseSpinner.Value;
            advan_elecNoise = app.elecNoiseSpinner.Value;
            advan_alpha = app.alphaSpinner.Value;
            advan_energySwitch = app.energyParamSwitch.Value;
            

            paramsStruct = struct();
            basicParamStruct = struct();
            simulBasisStruct = struct();
            trainParamStruct = struct();
            leaderTrajStruct = struct();
            trajPosiStruct = struct();
            trajVeloStruct = struct();
            ctrlParamStruct = struct();
            physicalStruct = struct();
            advanParamStruct = struct();
            delayParamStruct = struct();
            noiseParamStruct = struct();
            energyParamStruct = struct();


            simulBasisStruct.frequency = basic_frequency;
            simulBasisStruct.totalTime = basic_totalTime;
            trainParamStruct.trainNum = basic_trainNum;
            trainParamStruct.trainLength = basic_trainLength;
            trainParamStruct.trainSpacing = basic_trainSpacing;
            trainParamStruct.startPosi = str2double(split(basic_startPosi, ','));
            trainParamStruct.startVelo = str2double(split(basic_startVelo, ','));

            leaderTrajStruct.trajDesign = basic_trajDesign;
            
            posiPairsCell = strsplit(basic_trajPosi, ';');
            for index = 1:numel(posiPairsCell)
                pairCell = split(posiPairsCell(index),',');
                trajPosiStruct.(pairCell{1}) = str2double(pairCell{2});
            end    
            veloPairsCell = strsplit(basic_trajVelo, ';');
            for index = 1:numel(veloPairsCell)
                pairCell = split(veloPairsCell(index),',');
                trajVeloStruct.(pairCell{1}) = str2double(pairCell{2});
            end 
            
            basicParamStruct.topology = basic_topology;

            ctrlParamStruct.Kp = basic_Kp;
            ctrlParamStruct.Kv = basic_Kv;

            physicalStruct.veloLimit = basic_veloLimit;
            physicalStruct.ctrlLimit = basic_ctrlLimit;
            physicalStruct.c0 = basic_c0;
            physicalStruct.c1 = basic_c1;
            physicalStruct.c2 = basic_c2;


            basicParamStruct.simulBasis = simulBasisStruct;
            basicParamStruct.trainParam = trainParamStruct;
            leaderTrajStruct.trajPosi = trajPosiStruct;
            leaderTrajStruct.trajVelo = trajVeloStruct;
            basicParamStruct.leaderTraj = leaderTrajStruct;
            basicParamStruct.ctrlParam = ctrlParamStruct;
            basicParamStruct.physical = physicalStruct;
            paramsStruct.basicParam = basicParamStruct;

            if strcmp(advan_switch,'On')
                advanParamStruct.enable = true;
            else
                advanParamStruct.enable = false;
            end   
                
            if strcmp(advan_delaySwitch,'On')
                delayParamStruct.enable = true;
            else
                delayParamStruct.enable = false;
            end        
            delayParamStruct.delayMode = advan_delayMode;
            delayParamStruct.fixDelay =  advan_fixDelay;
            delayParamStruct.flucDelay = advan_flucDelay;

            if strcmp(advan_noiseSwitch,'On')
                noiseParamStruct.enable = true;
            else
                noiseParamStruct.enable = false;
            end        
            noiseParamStruct.noiseMode = advan_noiseMode;
            noiseParamStruct.frictionNoise = advan_frictionNoise;
            noiseParamStruct.elecNoise = advan_elecNoise;
            noiseParamStruct.alpha = advan_alpha;

            if strcmp(advan_energySwitch,'On')
                energyParamStruct.enable = true;
            else
                energyParamStruct.enable = false;
            end       
            
            advanParamStruct.delayParam = delayParamStruct;
            advanParamStruct.noiseParam = noiseParamStruct;
            advanParamStruct.energyParam = energyParamStruct;
            paramsStruct.advanParam = advanParamStruct;

            app.m_jsonHelper.saveParamsStruct(paramsName,paramsStruct);
        end

        function advanSwitchValueChanged(app,event)
            paramValueChanged(app);

            advanSwitch = app.advanParamSwitch.Value;
            if strcmp(advanSwitch, 'On')
                app.delayParamLabel.Enable = "on";
                app.delayParamSwitch.Enable = "on";
                app.noiseParamLabel.Enable = "on";
                app.noiseParamSwitch.Enable = "on";
                app.energyParamLabel.Enable = "on";
                app.energyParamSwitch.Enable = "on";

                delaySwitchValueChanged(app); 
                noiseSwitchValueChanged(app);
                energySwitchValueChanged(app);     

            elseif strcmp(advanSwitch, 'Off')
                app.delayParamLabel.Enable = "off";
                app.delayParamSwitch.Enable = "off";
                app.delayModeLabel.Enable = "off";
                app.delayModeDropDown.Enable = "off";
                app.fixDelayLabel.Enable = "off";
                app.fixDelaySpinner.Enable = "off";
                app.flucDelayLabel.Enable = "off";
                app.flucDelaySpinner.Enable = "off";

                app.noiseParamLabel.Enable = "off";
                app.noiseParamSwitch.Enable = "off";
                app.noiseModeLabel.Enable = "off";
                app.noiseModeDropDown.Enable = "off";
                app.frictionNoiseLabel.Enable = "off";
                app.frictionNoiseSpinner.Enable = "off";
                app.elecNoiseLabel.Enable = "off";
                app.elecNoiseSpinner.Enable = "off";
                app.alphaLabel.Enable = "off";
                app.alphaSpinner.Enable = "off";

                app.energyParamLabel.Enable = "off";
                app.energyParamSwitch.Enable = "off";
                app.energyRealtimeLabel.Enable = "off";
                app.energyRealtimeTextArea.Enable = "off";
            end        

        end
        
        function delaySwitchValueChanged(app,event)
            paramValueChanged(app);

            delaySwitch = app.delayParamSwitch.Value;
            if strcmp(delaySwitch, 'On')
                app.delayModeLabel.Enable = "on";
                app.delayModeDropDown.Enable = "on";
                app.fixDelayLabel.Enable = "on";
                app.fixDelaySpinner.Enable = "on";
                app.flucDelayLabel.Enable = "on";
                app.flucDelaySpinner.Enable = "on";
            elseif strcmp(delaySwitch, 'Off')
                app.delayModeLabel.Enable = "off";
                app.delayModeDropDown.Enable = "off";
                app.fixDelayLabel.Enable = "off";
                app.fixDelaySpinner.Enable = "off";
                app.flucDelayLabel.Enable = "off";
                app.flucDelaySpinner.Enable = "off";
            end
        end
        
        function noiseSwitchValueChanged(app,event)
            paramValueChanged(app);

            noiseSwitch = app.noiseParamSwitch.Value;
            if strcmp(noiseSwitch, 'On')
                app.noiseModeLabel.Enable = "on";
                app.noiseModeDropDown.Enable = "on";
                app.frictionNoiseLabel.Enable = "on";
                app.frictionNoiseSpinner.Enable = "on";
                app.elecNoiseLabel.Enable = "on";
                app.elecNoiseSpinner.Enable = "on";

                noiseMode = app.noiseModeDropDown.Value;
                if strcmp(noiseMode, '干扰观测器')
                    app.alphaLabel.Enable = "on";
                    app.alphaSpinner.Enable = "on";
                else
                    app.alphaLabel.Enable = "off";
                    app.alphaSpinner.Enable = "off";
                end        
            elseif strcmp(noiseSwitch, 'Off')
                app.noiseModeLabel.Enable = "off";
                app.noiseModeDropDown.Enable = "off";
                app.frictionNoiseLabel.Enable = "off";
                app.frictionNoiseSpinner.Enable = "off";
                app.elecNoiseLabel.Enable = "off";
                app.elecNoiseSpinner.Enable = "off";
                app.alphaLabel.Enable = "off";
                app.alphaSpinner.Enable = "off";
            end
        end

        function noiseModeValueChanged(app,event)
            paramValueChanged(app);

            noiseMode = app.noiseModeDropDown.Value;
            if strcmp(noiseMode,'无干扰补偿')
                app.alphaLabel.Enable = "off";
                app.alphaSpinner.Enable = "off";
            elseif strcmp(noiseMode,'干扰观测器')
                app.alphaLabel.Enable = "on";
                app.alphaSpinner.Enable = "on";
            end        
        end

        function energySwitchValueChanged(app,event)
            paramValueChanged(app);

            energySwitch = app.energyParamSwitch.Value;
            if strcmp(energySwitch, 'On')
                app.energyRealtimeLabel.Enable = "on";
                app.energyRealtimeTextArea.Enable = "on";
            elseif strcmp(energySwitch, 'Off')
                app.energyRealtimeLabel.Enable = "off";
                app.energyRealtimeTextArea.Enable = "off";
            end
        end

        function startBtnPushed(app, event)
            if ~app.isParamSaved
                uialert(app.uiFigure,'参数未保存，请先保存参数!','错误');
                return;
            end

            % 计算各个变量的结果
            calculateResult(app);

            % 准备好计时器的预设参数
            timeVector = app.m_lastResult{5};
            position = app.m_lastResult{1};
            frequency = timeVector(2);
            totalTime = timeVector(end);
            [trainNum, stepNum] = size(position);
            app.m_stepTimer.TasksToExecute = stepNum;
            app.m_stepTimer.Period = frequency;
            app.m_stepNumGone = 0;

            % 准备可视化
            cla(app.animeAxes);
            cla(app.positionAxes);
            cla(app.velocityAxes);
            cla(app.errorAxes);
            cla(app.controlInputAxes);

            legend(app.positionAxes,'off');
            legend(app.velocityAxes,'off');
            legend(app.errorAxes,'off');
            legend(app.controlInputAxes,'off');

            xlim(app.positionAxes, [0 totalTime]);
            xlim(app.velocityAxes, [0 totalTime]);
            xlim(app.errorAxes, [0 totalTime]);
            xlim(app.controlInputAxes, [0 totalTime]);

            hold(app.positionAxes,"on");
            hold(app.velocityAxes,"on");
            hold(app.errorAxes,"on");
            hold(app.controlInputAxes,"on");
            
            app.m_animeRectangles = gobjects(trainNum, 1);
            app.m_positionLines = gobjects(trainNum, 1);
            app.m_velocityLines = gobjects(trainNum, 1);
            app.m_errorLines = gobjects(trainNum, 1);
            app.m_controlInputLines = gobjects(trainNum, 1);

            colors = lines(trainNum);
            for trainIndex = 1:trainNum
                app.m_animeRectangles(trainIndex) = rectangle(app.animeAxes,'FaceColor',colors(trainIndex,:),'EdgeColor','k','LineWidth',1.5);
                app.m_positionLines(trainIndex) = plot(app.positionAxes, NaN, NaN, 'Color',colors(trainIndex,:),'LineWidth',1.5);
                app.m_velocityLines(trainIndex) = plot(app.velocityAxes, NaN, NaN, 'Color',colors(trainIndex,:),'LineWidth',1.5);
                if trainIndex > 1
                    app.m_errorLines(trainIndex) = plot(app.errorAxes, NaN, NaN, 'Color',colors(trainIndex,:),'LineWidth',1.5);
                    app.m_controlInputLines(trainIndex) = plot(app.controlInputAxes, NaN, NaN, 'Color',colors(trainIndex,:),'LineWidth',1.5);
                end    
            end
            hold(app.positionAxes,"off");
            hold(app.velocityAxes,"off");
            hold(app.errorAxes,"off");
            hold(app.controlInputAxes,"off");

            % 启动计时器
            start(app.m_stepTimer);

            % 切换界面
            if ~strcmp(app.m_currentPanel, '可视化')
                setPanel(app,'可视化');
            end   

            % 改变状态
            setStatus(app,'正在运行');
        end   

        function pauseBtnPushed(app,event)
            if ~app.isParamSaved
                uialert(app.uiFigure,'参数未保存，请先保存参数!','错误');
                return;
            end

            % 暂停计时器
            stop(app.m_stepTimer);

            % 切换界面
            if ~strcmp(app.m_currentPanel, '可视化')
                setPanel(app,'可视化');
            end  

            % 改变状态
            setStatus(app,'已暂停');
        end

        function continueBtnPushed(app,event)
            if ~app.isParamSaved
                uialert(app.uiFigure,'参数未保存，请先保存参数!','错误');
                return;
            end

            % 设置计时器的剩余步数
            timeVector = app.m_lastResult{5};
            stepNum = length(timeVector);
            app.m_stepTimer.TasksToExecute = stepNum - app.m_stepNumGone;

            % 重新启动计时器
            start(app.m_stepTimer);

            % 切换界面
            if ~strcmp(app.m_currentPanel, '可视化')
                setPanel(app,'可视化');
            end   

            % 设置状态
            setStatus(app,'正在运行');
        end  

        function resultBtnPushed(app,event)
            if ~app.isParamSaved
                uialert(app.uiFigure,'参数未保存，请先保存参数!','错误');
                return;
            end

            switch app.m_currentScenario
                case 'teaching'
                    switch app.m_currentStatus
                        case '正在运行'
                            stop(app.m_stepTimer);
                            app.m_stepNumGone = 0;
                        case '已暂停'
                            app.m_stepNumGone = 0;
                        case '回放中'     
                            stop(app.m_stepTimer);
                            app.m_stepNumGone = 0;
                        otherwise
                            
                    end

                    % 直接画最后的结果
                    drawResult(app);

                case 'research'    
                    switch app.m_currentStatus
                        case '准备就绪'
                            % 设置状态
                            setStatus(app,'正在运行');

                            % 计算结果
                            calculateResult(app);

                        case '回放中'     
                            stop(app.m_stepTimer);
                            app.m_stepNumGone = 0;
                            
                    end

                    % 获取仿真参数
                    position = app.m_lastResult{1};
                    velocity = app.m_lastResult{2};
                    spacingError = app.m_lastResult{3};
                    controlInput = app.m_lastResult{4};
                    timeVector = app.m_lastResult{5};
                    energy = app.m_lastResult{7};
                    totalTime = timeVector(end);
                    [trainNum, stepNum] = size(position);

                    % 准备可视化
                    cla(app.positionAxes);
                    cla(app.velocityAxes);
                    cla(app.errorAxes);
                    cla(app.controlInputAxes);

                    legend(app.positionAxes,'off');
                    legend(app.velocityAxes,'off');
                    legend(app.errorAxes,'off');
                    legend(app.controlInputAxes,'off');

                    xlim(app.positionAxes, [0 totalTime]);
                    xlim(app.velocityAxes, [0 totalTime]);
                    xlim(app.errorAxes, [0 totalTime]);
                    xlim(app.controlInputAxes, [0 totalTime]);

                    hold(app.positionAxes,"on");
                    hold(app.velocityAxes,"on");
                    hold(app.errorAxes,"on");
                    hold(app.controlInputAxes,"on");

                    app.m_positionLines = gobjects(trainNum, 1);
                    app.m_velocityLines = gobjects(trainNum, 1);
                    app.m_errorLines = gobjects(trainNum, 1);
                    app.m_controlInputLines = gobjects(trainNum, 1);

                    colors = lines(trainNum);
                    for trainIndex = 1:trainNum
                        app.m_positionLines(trainIndex) = plot(app.positionAxes, NaN, NaN, 'Color',colors(trainIndex,:),'LineWidth',1.5);
                        app.m_velocityLines(trainIndex) = plot(app.velocityAxes, NaN, NaN, 'Color',colors(trainIndex,:),'LineWidth',1.5);
                        if trainIndex > 1
                            app.m_errorLines(trainIndex) = plot(app.errorAxes, NaN, NaN, 'Color',colors(trainIndex,:),'LineWidth',1.5);
                            app.m_controlInputLines(trainIndex) = plot(app.controlInputAxes, NaN, NaN, 'Color',colors(trainIndex,:),'LineWidth',1.5);
                        end    
                    end

                    hold(app.positionAxes,"off");
                    hold(app.velocityAxes,"off");
                    hold(app.errorAxes,"off");
                    hold(app.controlInputAxes,"off");

                    for trainIndex = 1:trainNum
                        app.m_positionLines(trainIndex).XData = timeVector;
                        app.m_positionLines(trainIndex).YData = position(trainIndex,1:stepNum); 
                        
                        app.m_velocityLines(trainIndex).XData = timeVector;
                        app.m_velocityLines(trainIndex).YData = velocity(trainIndex,1:stepNum);
                        
                        if trainIndex > 1
                            app.m_errorLines(trainIndex).XData = timeVector;
                            app.m_errorLines(trainIndex).YData = spacingError(trainIndex,1:stepNum);
                        
                            app.m_controlInputLines(trainIndex).XData = timeVector;
                            app.m_controlInputLines(trainIndex).YData = controlInput(trainIndex,1:stepNum);
                        end    
                    end

                    legend(app.positionAxes,["Leader", "Follower " + string(2:trainNum)],'Location','best');
                    legend(app.velocityAxes,["Leader", "Follower " + string(2:trainNum)],'Location','best');
                    legend(app.errorAxes,["Follower " + string(2:trainNum)],'Location','best');
                    legend(app.controlInputAxes,["Follower " + string(2:trainNum)],'Location','best');

                    % 显示总能耗
                    if ~all(energy == 0)
                        energyText = sprintf("能耗计算结果 (Energy Consumption)\n\n------------------------------------------------------------\n");
                        energy_sum = 0;
                        for trainIdx = 2:trainNum
                            energy_sum = energy_sum + energy(trainIdx, stepNum);
                            energyText = energyText + sprintf("跟随车 %d 总能耗: \t%.2f\t(m²/s³)\n", trainIdx, energy(trainIdx, stepNum));
                        end
                        energyText = energyText + sprintf("所有跟随车总能耗: \t%.2f\t(m²/s³)\n------------------------------------------------------------\n", energy_sum);
                        app.energyRealtimeTextArea.Value = energyText;
                    end


                otherwise
                    
            end

            % 设置状态
            setStatus(app,'准备就绪');

            % 切换界面
            if ~strcmp(app.m_currentPanel, '可视化')
                setPanel(app,'可视化');
            end 

        end

        function replayBtnPushed(app,event)
            if ~app.isParamSaved
                uialert(app.uiFigure,'参数未保存，请先保存参数!','错误');
                return;
            end

            % 判断是否有上一次仿真结果
            if isempty(app.m_lastResult)
                uialert(app.uiFigure,'没有可回放的仿真记录!','错误');
                return;
            end  

            % 获取回放速度
            answer = inputdlg('请输入回放速度倍数 (1=正常速度, 2=2倍速, 0.5=0.5倍速)','回放设置', 1, {'1'});
            if isempty(answer)
                % 取消
                return;
            end
            
            replayFactor = str2double(answer{1});

            if isnan(replayFactor) || replayFactor <= 0
                % 不能为空或非正数
                uialert(app.uiFigure, '无效的回放速度!', '错误');
                return;
            end

            % 清除插图
            legend(app.positionAxes,'off');
            legend(app.velocityAxes,'off');
            legend(app.errorAxes,'off');
            legend(app.controlInputAxes,'off');

            % 开始准备回放计时器
            timeVector = app.m_lastResult{5};
            frequency = timeVector(2);
            period = frequency/replayFactor;
            stepNum = length(timeVector);
            if period < 0.001
                uialert(app.uiFigure, '倍数过大，最低采样频率为 0.001s (1毫秒)!', '错误');
                return;
            end
            app.m_stepTimer.Period = period;
            app.m_stepTimer.TasksToExecute = stepNum;
            
            % 启动计时器
            start(app.m_stepTimer);

            % 切换界面
            if ~strcmp(app.m_currentPanel, '可视化')
                setPanel(app,'可视化');
            end  

            % 设置状态
            setStatus(app,'回放中');            
        end

        function paramsAddBtnPushed(app,event)
            if ~app.isParamSaved
                uialert(app.uiFigure,'参数未保存，请先保存参数!','错误');
                return;
            end

            answer = inputdlg('为新参数集命名', '新建参数集',[1 45], {'NewParams'});
            if isempty(answer)
                % 取消
                return;
            end

            paramsName = answer{1};
            % 检查是否重复
            if ismember(paramsName, app.m_jsonHelper.m_paramsNameList)
                % 已有同名参数集
                uialert(app.uiFigure, '参数集名称重复，请重新输入！', '错误', 'Icon', 'warning');
                return;
            end    

            % 新建参数集
            app.m_jsonHelper.writeDefaultParams(paramsName);

            % 选择并显示新建的参数集
            app.currentParamsDropDown.Items = [app.currentParamsDropDown.Items, {paramsName}];
            app.currentParamsDropDown.Value = paramsName;
            currentParamsValueChanged(app);

            % 成功
            uialert(app.uiFigure,'新建成功!','新建参数集','Icon','success')
        end
        
        function paramsDeleteBtnPushed(app, event)
            if ~app.isParamSaved
                uialert(app.uiFigure,'参数未保存，请先保存参数!','错误');
                return;
            end

            paramsName = app.currentParamsDropDown.Value;
            if strcmp(paramsName, 'default')
                uialert(app.uiFigure,'不支持删除默认参数集!','删除参数集');
                return;
            end    
            choice = uiconfirm(app.uiFigure,sprintf('确定要删除当前参数集 %s 吗?',paramsName),'删除参数集',"Options",["确定删除","我再想想"],"DefaultOption",2,"CancelOption",2);
            if strcmp(choice, '我再想想')
                return;
            end

            % 确定删除本地参数集
            app.m_jsonHelper.deleteParams(paramsName);

            % 更新 dropdown
            idxToRemove = find(strcmp(app.currentParamsDropDown.Items, paramsName));
            if ~isempty(idxToRemove)
                app.currentParamsDropDown.Items(idxToRemove) = [];
            end  
            app.currentParamsDropDown.Value = 'default';
            currentParamsValueChanged(app);


            % 成功
            uialert(app.uiFigure,'删除成功!','删除参数集','Icon','success')
        end    

        function stepStartFunc(app)

        end

        function stepTimerFunc(app)
            % 渲染画面
            currentStep = app.m_stepNumGone + app.m_stepTimer.TasksExecuted;

            position = app.m_lastResult{1};
            velocity = app.m_lastResult{2};
            spacingError = app.m_lastResult{3};
            controlInput = app.m_lastResult{4};
            timeVector = app.m_lastResult{5};
            trainLength = app.m_lastResult{6};
            realtimeEnergy = app.m_lastResult{8};
            [trainNum, ~] = size(position);
            
            for trainIndex = 1:trainNum
                pos = [(position(trainIndex,currentStep)-trainLength),0,trainLength,5];
                app.m_animeRectangles(trainIndex).Position = pos;

                app.m_positionLines(trainIndex).XData = timeVector(1:currentStep);
                app.m_positionLines(trainIndex).YData = position(trainIndex,1:currentStep); 
                
                app.m_velocityLines(trainIndex).XData = timeVector(1:currentStep);
                app.m_velocityLines(trainIndex).YData = velocity(trainIndex,1:currentStep);
                
                if trainIndex > 1
                    app.m_errorLines(trainIndex).XData = timeVector(1:currentStep);
                    app.m_errorLines(trainIndex).YData = spacingError(trainIndex,1:currentStep);
                
                    app.m_controlInputLines(trainIndex).XData = timeVector(1:currentStep);
                    app.m_controlInputLines(trainIndex).YData = controlInput(trainIndex,1:currentStep);
                end    
            end

            drawnow limitrate;

            % 显示实时能耗
            if (app.m_currentScenario == "research") & (app.advanParamSwitch.Value == 'On') & (app.energyParamSwitch.Value == 'On')
                energyText = sprintf("实时能耗 (Realtime Energy)\n\n------------------------------------------------------------\n");
                energyText = energyText + sprintf("%s------------------------------------------------------------\n",realtimeEnergy(currentStep));
                app.energyRealtimeTextArea.Value = energyText;
            end    

        end
        
        function stepStopFunc(app)
            if isempty(app.m_lastResult)  
                % 避免在没有计算就退出系统后的报错
                return;
            end  

            % 每次暂停 累计步数
            app.m_stepNumGone = app.m_stepNumGone + app.m_stepTimer.TasksExecuted;

            % 走到最后一步   
            timeVector = app.m_lastResult{5};
            stepNum = length(timeVector);
            energy = app.m_lastResult{7};
            if app.m_stepNumGone == stepNum
                % 清除步数
                app.m_stepNumGone = 0;

                % 插入标注各车
                position = app.m_lastResult{1};
                [trainNum, ~] = size(position);
                legend(app.positionAxes,["Leader", "Follower " + string(2:trainNum)],'Location','best');
                legend(app.velocityAxes,["Leader", "Follower " + string(2:trainNum)],'Location','best');
                legend(app.errorAxes,["Follower " + string(2:trainNum)],'Location','best');
                legend(app.controlInputAxes,["Follower " + string(2:trainNum)],'Location','best');

                % 设置状态
                setStatus(app,'准备就绪');

                % 自动结束时显示最终能耗
                if (app.m_currentScenario == "research") & (app.advanParamSwitch.Value == 'On') & (app.energyParamSwitch.Value == 'On')
                    % 显示总能耗
                    if ~all(energy == 0)
                        energyText = sprintf("能耗计算结果 (Energy Consumption)\n\n------------------------------------------------------------\n");
                        energy_sum = 0;
                        for trainIdx = 2:trainNum
                            energy_sum = energy_sum + energy(trainIdx, stepNum);
                            energyText = energyText + sprintf("跟随车 %d 总能耗: \t%.2f\t(m²/s³)\n", trainIdx, energy(trainIdx, stepNum));
                        end
                        energyText = energyText + sprintf("所有跟随车总能耗: \t%.2f\t(m²/s³)\n------------------------------------------------------------\n", energy_sum);
                        app.energyRealtimeTextArea.Value = energyText;
                    end
                end    

            end  
               
        end
    
    end
end