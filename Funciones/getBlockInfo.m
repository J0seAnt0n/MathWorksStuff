function [numInputPorts, numOutputPorts, inputPortNames, outputPortNames, inputPortHandles, outputPortHandles] = getBlockInfo(blockPath)
    % Obtener manejadores de los puertos
    hPorts = get_param(blockPath, 'PortHandles');

    % Obtener el número de puertos de entrada y salida
    numInputPorts = length(hPorts.Inport);
    numOutputPorts = length(hPorts.Outport);

    % Inicializar las celdas para los nombres de los puertos y los handles
    inputPortNames = cell(1, numInputPorts);
    outputPortNames = cell(1, numOutputPorts);
    inputPortHandles = cell(1, numInputPorts);
    outputPortHandles = cell(1, numOutputPorts);

    % Obtener los nombres y handles de los puertos de entrada
    for i = 1:numInputPorts
        inputPortNames{i} = get_param(hPorts.Inport(i), 'Name');
        inputPortHandles{i} = hPorts.Inport(i);
    end

    % Obtener los nombres y handles de los puertos de salida
    for i = 1:numOutputPorts
        outputPortNames{i} = get_param(hPorts.Outport(i), 'Name');
        outputPortHandles{i} = hPorts.Outport(i);
    end
end
