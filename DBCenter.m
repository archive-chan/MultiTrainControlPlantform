classdef DBCenter < handle
    properties (Access = private)
        m_dbPath;
        m_conn;
    end

    properties (Access = public)
        m_tableNum;
        m_lastError;
    end

    methods (Access = public)
        function obj = DBCenter(path)
            % 初始化成员
            if nargin > 0
                obj.m_dbPath = path;
            else
                obj.m_dbPath = 'local.db';
            end
            obj.m_tableNum = 0;
            obj.m_lastError = '';

            try
                % 获取绝对路径 方便后续连接数据库
                absolteFullPath = fullfile(pwd,obj.m_dbPath);
    
                % 判断数据库文件路径是否存在
                if ~exist(obj.m_dbPath,'file')
                    % 不存在 获取路径中文件夹部分       
                    [dirsPath, ~, ~] = fileparts(obj.m_dbPath);
                    
                    % 判断文件夹部分是否为pwd
                    if ~isempty(dirsPath)
                        % pwd下有其他中间文件夹 判断中间文件夹的存在
                        if ~exist(dirsPath, 'dir')
                            % 中间有文件夹缺失 自动创建
                            mkdir(dirsPath);
    
                        end   
                    end
    
                    % 数据库文件要求在pwd下 或 已创建缺失文件夹
                    % 创建数据库db文件 并自动连接
                    obj.m_conn = sqlite(absolteFullPath,"create");
                end
    
                % db文件存在 建立连接
                obj.m_conn = sqlite(absolteFullPath);

                % 查询表数量
                query = "select count(*) from sqlite_master where type = 'table'";
                results = fetch(obj.m_conn, query);
                obj.m_tableNum = results.(1);
                
            catch msgException
                % 执行过程中有报错
                obj.m_lastError = sprintf('初始化失败: %s', msgException.message);
                error(obj.m_lastError);
                
            end
        end
        
        function delete(obj)
            close(obj.m_conn);
        end   

        function isSuccess = createTable(obj, tableName, fields)
            % CREATE TABLE IF NOT EXISTS tableName ( fields )
            obj.m_lastError = '';
            isSuccess = false;
        
            createSql = sprintf('CREATE TABLE IF NOT EXISTS %s ( %s )', tableName, fields);

            try
                execute(obj.m_conn,createSql);
                isSuccess = true;

            catch msgException
                % 执行过程中有报错
                obj.m_lastError = sprintf('表格 %s 创建失败: %s', tableName, msgException.message);
                error(obj.m_lastError);

            end        
        end

        function records = selectAllCondition(obj, tableName, conditionRowFilter) 
            % SELECT * FROM tableName WHERE condition
            obj.m_lastError = '';
            records = table();     

            try 
                if nargin == 2
                    records = sqlread(obj.m_conn, tableName);
                else
                    records = sqlread(obj.m_conn, tableName, "RowFilter", conditionRowFilter);
                end        
                
                
            catch msgException
                obj.m_lastError = sprintf('表格 %s 条件全查询失败: %s', tableName, msgException.message);
                error(obj.m_lastError);
            end    
            
        end
        
        function isSuccess = insertRecord(obj, tableName, fieldNames, fieldValues)
            % insert into tableName (username,password,scenario) values()
            isSuccess = false;
            obj.m_lastError = '';

            % 构建sql语句
            formattedElements = cell(size(fieldValues));
            for i = 1:length(fieldValues)
                if isnumeric(fieldValues{i})
                    % 数字类型转换为字符串
                    formattedElements{i} = num2str(fieldValues{i});
                elseif ischar(fieldValues{i}) || isstring(fieldValues{i})
                    % 字符串类型添加单引号
                    formattedElements{i} = ['''', fieldValues{i}, ''''];
                elseif islogical(fieldValues{i})
                    % 布尔类型转换为字符串
                    formattedElements{i} = lower(string(fieldValues{i}));
                elseif isempty(fieldValues{i})
                    % 空值转换为NULL
                    formattedElements{i} = 'NULL';
                else
                    % 其他类型转换为字符串
                    formattedElements{i} = string(fieldValues{i});
                end
            end
            valuesStr = strjoin(formattedElements, ', ');
            namesStr = strjoin(fieldNames,', ');
            insertSql = sprintf('INSERT INTO %s ( %s ) VALUES ( %s )', tableName, namesStr, valuesStr);

            try
                execute(obj.m_conn, insertSql);
                isSuccess = true;

            catch msgException
                % 执行过程中有报错
                obj.m_lastError = sprintf('表格 %s 插入记录失败: %s', tableName, msgException.message);
                error(obj.m_lastError);
            end        

        end    

        function records = selectFieldCondition(obj,tableName,fieldNames,conditionRowFilter)
            % SELECT fieldNames FROM tableName WHERE condition
            obj.m_lastError = '';
            records = table();

            selectSql = sprintf('SELECT %s FROM %s', strjoin(fieldNames,','), tableName);

            try
                records = fetch(obj.m_conn, selectSql, "RowFilter", conditionRowFilter);
            catch msgException
                obj.m_lastError = sprintf('表格 %s 条件字段查询失败: %s', tableName, msgException.message);
                error(obj.m_lastError);
            end   

        end    
    
        function isSuccess = insertRecords(obj, tableName, fieldNames, fieldValues)
            % insert into tableName (username,password,scenario) values('nihao', 22, 425)
            isSuccess = false;
            obj.m_lastError = '';

            namesStr = strjoin(fieldNames,', ');

            recordNum = length(fieldValues{1});
            for rIndex = 1:recordNum
                % 构建sql语句
                formattedElements = {};
                for fIndex = 1:length(fieldNames)
                    v = fieldValues{fIndex}(rIndex);
                    if isnumeric(v)
                        % 数字类型转换为字符串
                        formattedElements{fIndex} = num2str(v);
                    elseif ischar(v) || isstring(v)
                        % 字符串类型添加单引号
                        formattedElements{fIndex} = ['''', v, ''''];
                    elseif islogical(v)
                        % 布尔类型转换为字符串
                        formattedElements{fIndex} = lower(string(v));
                    elseif isempty(v)
                        % 空值转换为NULL
                        formattedElements{fIndex} = 'NULL';
                    else
                        % 其他类型转换为字符串
                        formattedElements{fIndex} = string(v);
                    end

                end
                valuesStr = strjoin(formattedElements, ', ');
                insertSql = sprintf('INSERT INTO %s ( %s ) VALUES ( %s )', tableName, namesStr, valuesStr);

                try
                    execute(obj.m_conn, insertSql);
                    isSuccess = true;

                catch msgException
                    % 执行过程中有报错
                    obj.m_lastError = sprintf('表格 %s 批量插入记录失败: %s', tableName, msgException.message);
                    error(obj.m_lastError);
                end  
                
            end

        end    
    
        function isSuccess = deleteTable(obj, tableName)
            isSuccess = false;
            obj.m_lastError = '';

            sql = sprintf('DROP TABLE %s', tableName);

            try
                execute(obj.m_conn, sql);
                isSuccess = true;

            catch msgException
                % 执行过程中有报错
                obj.m_lastError = sprintf('表格 %s 删除失败: %s', tableName, msgException.message);
                error(obj.m_lastError);
            end  


        end

    end
end