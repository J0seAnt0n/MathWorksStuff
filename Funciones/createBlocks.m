% function createBlocks(block, blockinputs, init_pos)
%     % Carga el sistema de Simulink
%     load_system('simulink');
% 
%     % Define la distancia entre bloques
%     offset = 50;
% 
%     % Obtiene el tamaño del bloque original
%     original_block_size = get_param(block, 'Position');
%     original_block_size = original_block_size(3:4) - original_block_size(1:2);
% 
%     % Itera sobre cada elemento en blockinputs
%     for i = 1:length(blockinputs)
%         % Calcula la posición del bloque
%         pos = [init_pos(1) init_pos(2)+offset*(i-1) init_pos(1)+original_block_size(1) init_pos(2)+offset*(i-1)+original_block_size(2)];
% 
%         % Añade el bloque al sistema
%         add_block(block, ['myModel/' blockinputs{i}], 'Position', pos);
% 
%     end
% end



function createBlocks(block, blockinputs, init_pos)
    % Carga el sistema de Simulink
    load_system('simulink');
    
    % Define la distancia entre bloques
    offset = 50;
    
    % Obtiene el tamaño del bloque original
    original_block_size = get_param(block, 'Position');
    original_block_size = original_block_size(3:4) - original_block_size(1:2);
    
    % Itera sobre cada elemento en blockinputs
    for i = 1:length(blockinputs)
        % Calcula la posición del bloque
        pos = [init_pos(1) init_pos(2)+offset*(i-1) init_pos(1)+original_block_size(1) init_pos(2)+offset*(i-1)+original_block_size(2)];
        
        % Añade el bloque al sistema
        blockName = ['myModel/' blockinputs{i}];
        add_block(block, blockName, 'Position', pos);
        
        setOutportName(blockName, blockinputs{i})
        
    end
end
