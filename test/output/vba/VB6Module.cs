/**
 * @file VB6Module.bas
 *  <summary>VB6 Module Example</summary>
 *  <remarks>The original unfiltered source of this file: <A HREF="http://trac.sevo.org/projects/doxyvb/browser/trunk/samples/ClassicVB/VB6Module.bas">VB6Module.bas</A></remarks>
 */
namespace vba {
	/** Is imported from extern library: kernel32.dll */
	public extern  long GetTickCount();
	/** Is imported from extern library: kernel32 */
	public extern  long WritePrivateProfileStringA(string strSection, string strKey, string strString, string strFileNameName);
	/**
	 *  Global variable example
	 */
	public double gl_test;
	/**
	 *  <summary>
	 *  simple VB6 Public Enum
	 *  </summary>
	 */
	public enum SampleEnum1
	{
		[_First] = 1,
		/**
		 *  First enum item
		 */
		First_Item = 1,
		Second_Item = 2, /**< \brief Second enum item */
		Third_Item = 3, /**< \brief Third enum item */
		[_Last] = 3
	}
	/**
	 *  <summary>
	 *  simple VB6 Private Enum
	 *  </summary>
	 */
	private enum SampleEnum2
	{
		[_First] = 1,
		First_Item = 1, /**< \brief First enum item */
		/**
		 *  Second emum item
		 */
		Second_Item = 2,
		Third_Item = 3,
		/**
		 *  Fourth enum item
		 */
		Fourth_Item = 4,
		[_Last] = 4
	}
	/**
	 *  <summary>
	 *  simple VBA/VB6 Type
	 *  </summary>
	 */
	public struct SampleVBAType
	{
		/**
		 *  simple integer value
		 */
		/**
		 *  simple single value
		 */
	}
	/**
	 *  <summary>
	 *  function with parameter
	 *  </summary>
	 *  <param name="pFirst">simple parameter</param>
	 *  <returns>some double value</returns>
	 *  <remarks>Test remark</remarks>
	 */
	public  double SampleModuleFunction(double pFirst);
	public  long SampleModuleFunction2(ref long pFirst) ; /**< \brief Sample function comment */
	/**
	 *  <summary>
	 *  simple method
	 *  </summary>
	 *  <remarks>Test remark</remarks>
	 */
	void SampleModuleMethod();
	void SampleModuleMethod2() ; /**< \brief Sample sub comment */
}
