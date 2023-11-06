function arrangeSubsystem(sysPath)
    % Carga el sistema de Simulink
   % load_system('simulink');
    
    % % Comprueba si el subsistema existe
    % if ~bdIsLoaded(sysPath)
    %     error('El subsistema especificado no existe');
    % end
    
    % Organiza los bloques dentro del subsistema
   % Simulink.BlockDiagram.arrangeSystem(sysPath);
    
    % Rutea las líneas para evitar traslapes
    % Simulink.BlockDiagram.routeLine(sysPath);
    % 
    % lineHandles = find_system(gcs,'FindAll','On','SearchDepth',1,'Type','Line');
    % Simulink.BlockDiagram.arrangeSystem(lineHandles, FullLayout='true')
    Simulink.BlockDiagram.arrangeSystem(sysPath);%, FullLayout='true')

    lineHandles = find_system(sysPath,'FindAll','On','SearchDepth',1,'Type','Line');
    Simulink.BlockDiagram.routeLine(lineHandles);

    

    




end
