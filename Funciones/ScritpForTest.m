%% Create a Goto and conect to a Bus Selector
ModelName = 'myModel';
InputFrom = {'Goto1'};
SignalInput = {'value1', 'value2', 'value3', 'value4', 'value5'};
position = [100, 100, 200, 120];
addBlocksAndConnect(InputFrom, SignalInput, position);


%% Add blocks aligned vertically

block = 'simulink/Sources/Constant';
blockinputs = {'uno', 'dos', 'tres', 'hol', 'como', 'estas'};
init_pos = [470   170];

createBlocks(block, blockinputs, init_pos);




%% Get block info
blockPath = 'myModel/tres';

[numIn, numOut, inNames, outNames, inHandles, outHandles] = getBlockInfo(blockPath);

% handle = outHandles{1};  
% newName = 'Nombre';  
% set_param(handle, 'Name', newName);

%arrangeSubsystem(ModelName);
%% Create subsystem without ports and with color
blockColor = mat2str([255, 208, 153]/255);
init_pos = [100 100];
createSubsystemBlock('myModel', 'mySubsystem17', init_pos, blockColor);



%% Create constant block and conect with a Bus Creator

modelPath = 'myModel';
Values = {'value1', 'value2', 'value3'};
init_pos = [607 278];
addConstantBlocks(modelPath, Values, init_pos);


%% Arrage blocks

arrangeSubsystem(ModelName);

