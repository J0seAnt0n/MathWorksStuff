function addBlocksAndConnect(inputFrom, signalInput, position)
    % Crear un modelo si no existe
    if ~bdIsLoaded('myModel')
        new_system('myModel')
    end
    load_system('myModel')
    
    % Añadir bloque From
    add_block('simulink/Signal Routing/From', 'myModel/From', 'Position', position, 'GotoTag', inputFrom{1});
    
    % Añadir bloque Bus Selector
    busPosition = position + [100, 0, 100, 0];
    add_block('simulink/Signal Routing/Bus Selector', 'myModel/BusSelector', 'Position', busPosition);
    set_param('myModel/BusSelector', 'OutputSignals', strjoin(signalInput, ','));
    
    % Conectar bloque From a Bus Selector
    line = add_line('myModel', 'From/1', 'BusSelector/1');
    set_param(line, 'Name', inputFrom{1});
    
    % Añadir bloques Terminator y conectarlos
    for i = 1:length(signalInput)
        terminatorPosition = busPosition + [100*i, 20*i, 100*i, 20*i];
        add_block('simulink/Sinks/Terminator', ['myModel/Terminator' num2str(i)], 'Position', terminatorPosition);
        line = add_line('myModel', ['BusSelector/' num2str(i)], ['Terminator' num2str(i) '/1']);
        %set_param(line, 'Name', signalInput{i});
    end
    
    % Guardar y abrir el modelo
    save_system('myModel')
    open_system('myModel')
end
