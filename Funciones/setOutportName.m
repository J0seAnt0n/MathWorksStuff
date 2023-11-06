function setOutportName(porthandle, blockName)
    % Obtiene los manejadores de los puertos del bloque
    hPorts = get_param(porthandle, 'PortHandles');
    
    % Establece el nombre del puerto de salida al nombre del bloque
    set_param(hPorts.Outport, 'Name', blockName);
end
