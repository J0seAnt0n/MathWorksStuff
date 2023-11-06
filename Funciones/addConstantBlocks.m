function addConstantBlocks(modelPath, Values, init_pos)
    % Abre el modelo Simulink
    load_system(modelPath)
    
    % Define la distancia entre bloques
    offset = 50;
    
    block = 'simulink/Sources/Constant';
    % Obtiene el tamaño del bloque original
    original_block_size = get_param(block, 'Position');
    original_block_size = original_block_size(3:4) - original_block_size(1:2);


    % Itera sobre los elementos en Values
    for i = 1:length(Values)

        % Calcula la posición del bloque
        pos = [init_pos(1) init_pos(2)+offset*(i-1) init_pos(1)+original_block_size(1) init_pos(2)+offset*(i-1)+original_block_size(2)];
        

        % Crea un bloque constante
        blockName = [modelPath '/' Values{i}]
        add_block('simulink/Sources/Constant', blockName, 'Position', pos)

  
        setOutportName(blockName, Values{i})
        %set_param([modelPath '/' Values{i}], 'OutDataTypeStr', 'Bus: Object')

        
    end

    % Añade un bloque Bus Creator
    add_block('simulink/Signal Routing/Bus Creator', [modelPath '/BusCreator'], 'Inputs', num2str(length(Values)), 'Position', [init_pos(1)+200 init_pos(2) init_pos(1)+250 init_pos(2)+50*length(Values)])

    % Conecta los bloques constantes al Bus Creator
    for i = 1:length(Values)
        add_line(modelPath, [Values{i} '/1'], ['BusCreator/' num2str(i)])
    end

    % Guarda y cierra el modelo
    % save_system(modelPath)
    % close_system(modelPath)
end
