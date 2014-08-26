Write-Output '<testcase classname="pkg1.test.test_things" name="test_params_func:1" time="0.000093" />
  <testcase classname="pkg1.test.test_things" name="test_params_func:2" time="0.000098">
    <failure message="test failure">Traceback (most recent call last):
  File "nose2/plugins/loader/parameters.py", line 162, in func
    return obj(*argSet)
  File "nose2/tests/functional/support/scenario/tests_in_package/pkg1/test/test_things.py", line 64, in test_params_func
    assert a == 1
AssertionError
</failure>
  </testcase>'