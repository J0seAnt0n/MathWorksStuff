function [vector] = get_block_dimensions(block, init_pos)
    % Get the dimensions of the block
    original_block_size = get_param(block, 'Position');
    original_block_size = original_block_size(3:4) - original_block_size(1:2);

    % Calculate the position of the block
    pos = [init_pos, init_pos + original_block_size];

    % Return the vector
    vector = pos;
end
