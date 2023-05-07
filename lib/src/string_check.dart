class StringCheck
{
  static String? check(String? value)
  {
    if(value!=null&&value.isNotEmpty)
    {
      return value;
    }
    else
    {
      return null;
    }
  }
}