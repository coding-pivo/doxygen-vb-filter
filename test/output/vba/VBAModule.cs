/** \file */
namespace vba {
	/**
	 *  <summary>VBA Module Example</summary>
	 *  <remarks>The original unfiltered source of this file: <A HREF="http://trac.sevo.org/projects/doxyvb/browser/trunk/samples/ClassicVB/VBAModule.bas">VBAModule.bas</A></remarks>
	 */
	/** \remark Is imported from external library: kernel32.dll */
	public extern  long GetTickCount();
	/** \remark Is imported from external library: kernel32 */
	public extern  long WritePrivateProfileStringA(string strSection, string strKey, string strString, string strFileNameName);
	/**
	 *  Global variable example
	 */
	public double gl_test;
	/**
	 *  <summary>
	 *  simple VBA Public Enum
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
	private enum SampleEnum2 /**< \brief simple VBA Private Enum String */
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
	 *  simple VBA Type
	 *  </summary>
	 */
	public struct SampleVBAType
	{
		/**
		 *  simple integer value
		 */
		int someInteger; 
		string someString; /**< \brief simple string value */
		long someLong; 
		/**
		 *  simple single value
		 */
		float someSingle; 
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
	 *  \cond DEVELOPMENT
	 *  <summary>
	 *  simple method
	 *  </summary>
	 *  <remarks>Test remark</remarks>
	 */
	void SampleModuleMethod();
	/**
	 *  \endcond
	 */
	/**
	 *  \cond DEVELOPMENT
	 */
	void SampleModuleMethod2() ; /**< \brief Sample sub comment */
	/**
	 *  \endcond
	 */
}
