Write-Output '  </testcase>
  <testcase classname="pkg1.test.test_things.SomeTests" name="test_gen_method:1" time="0.000094" />
  <testcase classname="pkg1.test.test_things.SomeTests" name="test_gen_method:2" time="0.000090">
    <failure message="test failure">Traceback (most recent call last):
  File "nose2/plugins/loader/generators.py", line 145, in method
    return func(*args)
  File "nose2/tests/functional/support/scenario/tests_in_package/pkg1/test/test_things.py", line 24, in check
    assert x == 1
AssertionError
</failure>
  </testcase>'