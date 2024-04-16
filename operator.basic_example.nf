
nums = Channel.of(1, 2, 3, 4)
squre = nums.map { it -> it * it }

squre.view()


// Channel
//  .of(1, 2, 3, 4)
//  .map{ it -> it * it }
//  .view()


