test_vpkswss_1:
  #_ REGISTER_IN v3 [00000001, 00000002, 00000003, 00000004]
  #_ REGISTER_IN v4 [00000005, 00000006, 00000007, 00000008]
  vpkswss v5, v3, v4
  blr
  #_ REGISTER_OUT v3 [00000001, 00000002, 00000003, 00000004]
  #_ REGISTER_OUT v4 [00000005, 00000006, 00000007, 00000008]
  #_ REGISTER_OUT v5 [00010002, 00030004, 00050006, 00070008]

test_vpkswss_2:
  #_ REGISTER_IN v3 [7FFFFFFF, 80000000, 00000000, 00000004]
  #_ REGISTER_IN v4 [7FFFFFFF, 80000000, 00000000, 00000008]
  vpkswss v5, v3, v4
  blr
  #_ REGISTER_OUT v3 [7FFFFFFF, 80000000, 00000000, 00000004]
  #_ REGISTER_OUT v4 [7FFFFFFF, 80000000, 00000000, 00000008]
  #_ REGISTER_OUT v5 [7FFF8000, 00000004, 7FFF8000, 00000008]

test_vpkswss_3:
  # {-1, -32768, 0, 32767}
  #_ REGISTER_IN v3 [FFFFFFFF, FFFF8000, 00000000, 00007FFF]
  # {-2, -32769, 1, 32768}
  #_ REGISTER_IN v4 [FFFFFFFE, FFFF7FFF, 00000001, 00008000]
  vpkswss v5, v3, v4
  blr
  #_ REGISTER_OUT v3 [FFFFFFFF, FFFF8000, 00000000, 00007FFF]
  #_ REGISTER_OUT v4 [FFFFFFFE, FFFF7FFF, 00000001, 00008000]
  # {-1, -32768, 0, 32767, -2, -32768, 1, 32767}
  #_ REGISTER_OUT v5 [FFFF8000, 00007FFF, FFFE8000, 00017FFF]
