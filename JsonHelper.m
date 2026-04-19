classdef JsonHelper < handle
    properties (Access = public)
        m_folderPath
        m_paramsNameList
        m_lastError
    end
    
    methods (Access = public)
        function this = JsonHelper(path)
            this.m_folderPath = path;
            this.m_paramsNameList = {};
            this.m_lastError = '';
            
            % 检查文件夹路径最深层的文件夹是否存在
            if ~exist(this.m_folderPath,"dir")
                % 不存在 直接创建整个路径中的所有文件夹
                mkdir(this.m_folderPath);
            end   
            % 存在 检查是否有默认参数集
            defaultParamFilePath = [this.m_folderPath,'/default.json'];
            if ~exist(defaultParamFilePath,"file")
                % 没有 写入默认参数集保存到本地
                writeDefaultParams(this, 'default');
               
            end    
            
            % 有 获得本地所有参数集的名字
            updateParamsNameList(this);
        end    

        function params = getParamsStruct(this, paramsName)
            params = struct();
            
            % 判断 paramsName 是否存在
            if ~ismember(this.m_paramsNameList,paramsName)
                % 不存在
                return;
            end    

            % 存在
            paramsFilePath = sprintf("%s/%s.json",this.m_folderPath,paramsName);
            params = readstruct(paramsFilePath);

        end   
        
        function saveParamsStruct(this, paramsName, paramsStruct)
            paramsFilePath = sprintf("%s/%s.json", this.m_folderPath, paramsName);
            writestruct(paramsStruct,paramsFilePath);

        end   
        
        function updateParamsNameList(this)
            files = dir(fullfile(this.m_folderPath, '*.json'));  % 获取所有 .json 文件
            this.m_paramsNameList = extractBefore({files.name}, '.');  % 转为元胞数组
        end    
    
        function writeDefaultParams(this, defaultParamsName)
            defaultParamFilePath = sprintf("%s/%s.json", this.m_folderPath, defaultParamsName);

            defaultJson = struct();

            % ========== basicParam ==========
            defaultJson.basicParam = struct();

            % --- simulBasis ---
            defaultJson.basicParam.simulBasis = struct();
            defaultJson.basicParam.simulBasis.frequency = 0.05;
            defaultJson.basicParam.simulBasis.totalTime = 60;

            % --- trainParam ---
            defaultJson.basicParam.trainParam = struct();
            defaultJson.basicParam.trainParam.trainNum = 4;
            defaultJson.basicParam.trainParam.trainLength = 100;
            defaultJson.basicParam.trainParam.trainSpacing = 400;
            defaultJson.basicParam.trainParam.startPosi = [0, -450, -950, -1700];
            defaultJson.basicParam.trainParam.startVelo = [35, 24, 12, 40];

            % --- leaderTraj ---
            defaultJson.basicParam.leaderTraj = struct();
            defaultJson.basicParam.leaderTraj.trajDesign = '按速度';

            % trajPosi
            defaultJson.basicParam.leaderTraj.trajPosi = struct();
            defaultJson.basicParam.leaderTraj.trajPosi.t10 = 900;
            defaultJson.basicParam.leaderTraj.trajPosi.t15 = 1500;
            defaultJson.basicParam.leaderTraj.trajPosi.t25 = 2000;
            defaultJson.basicParam.leaderTraj.trajPosi.t50 = 3500;
            defaultJson.basicParam.leaderTraj.trajPosi.t55 = 4500;

            % trajVelo
            defaultJson.basicParam.leaderTraj.trajVelo = struct();
            defaultJson.basicParam.leaderTraj.trajVelo.t10 = 60;
            defaultJson.basicParam.leaderTraj.trajVelo.t25 = 100;
            defaultJson.basicParam.leaderTraj.trajVelo.t50 = 40;

            % --- topology ---
            defaultJson.basicParam.topology = '前车跟随';

            % --- controlParam ---
            defaultJson.basicParam.ctrlParam = struct();
            defaultJson.basicParam.ctrlParam.Kp = 4;
            defaultJson.basicParam.ctrlParam.Kv = 6.5;

            % --- physical ---
            defaultJson.basicParam.physical = struct();
            defaultJson.basicParam.physical.veloLimit = 120;
            defaultJson.basicParam.physical.ctrlLimit = 200;
            defaultJson.basicParam.physical.c0 = 0.00176;
            defaultJson.basicParam.physical.c1 = 0.00077616;
            defaultJson.basicParam.physical.c2 = 0.000016;    

            % ========== advanParam ==========
            defaultJson.advanParam = struct();

            defaultJson.advanParam.enable = true;

            defaultJson.advanParam.delayParam = struct();
            defaultJson.advanParam.delayParam.enable = true;
            defaultJson.advanParam.delayParam.delayMode = '匀速预测';
            defaultJson.advanParam.delayParam.fixDelay = 1.5;
            defaultJson.advanParam.delayParam.flucDelay = 0.4;

            defaultJson.advanParam.noiseParam = struct();
            defaultJson.advanParam.noiseParam.enable = true;
            defaultJson.advanParam.noiseParam.noiseMode = "干扰观测器";
            defaultJson.advanParam.noiseParam.frictionNoise = 50;
            defaultJson.advanParam.noiseParam.elecNoise = 5;
            defaultJson.advanParam.noiseParam.alpha = 0.2;

            defaultJson.advanParam.energyParam = struct();
            defaultJson.advanParam.energyParam.enable = true;

            writestruct(defaultJson,defaultParamFilePath);

            updateParamsNameList(this);

        end    

        function deleteParams(this, paramsName)
            paramFilePath = sprintf("%s/%s.json", this.m_folderPath, paramsName);
            delete(paramFilePath);

            updateParamsNameList(this);
        end

    end    
    
end    