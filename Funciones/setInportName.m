function setInportName(porthandle, blockName)
    % Obtiene los manejadores de los puertos del bloque
    hPorts = get_param(porthandle, 'PortHandles');
    
    % Establece el nombre del puerto de entrada al nombre del bloque
    set_param(hPorts.Inport, 'Name', blockName);
end

