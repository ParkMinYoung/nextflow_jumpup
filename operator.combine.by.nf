left = Channel.of(['A', 1], ['B', 2], ['A', 3])
right = Channel.of(['B', 'x'], ['B', 'y'], ['A', 'z'], ['A', 'w'])

left
    .combine(right, by: 0)
    .view()

// # outputs
// [A, 1, z]
// [A, 3, z]
// [A, 1, w]
// [A, 3, w]
// [B, 2, x]
// [B, 2, y]
