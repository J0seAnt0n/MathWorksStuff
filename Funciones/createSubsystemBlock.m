function createSubsystemBlock(path, blockName, init_pos, color)
    % Define el nombre completo del bloque
    fullBlockName = [path '/' blockName];

    block ='simulink/Ports & Subsystems/Subsystem';
    init_pos = [-188   147];
    pos = get_block_dimensions(block, init_pos)

    % Añade el bloque de subsistema al modelo
    add_block('simulink/Ports & Subsystems/Subsystem', fullBlockName, 'Position', pos);
    
    % Elimina los puertos de entrada y salida del subsistema
    %set_param(fullBlockName, 'Ports', [0 0]);
    Simulink.SubSystem.deleteContents(fullBlockName)

    % Verifica si se especificó un color
    if nargin > 3
        % Establece el color del bloque
        set_param(fullBlockName, 'BackgroundColor', color);
    end
end
