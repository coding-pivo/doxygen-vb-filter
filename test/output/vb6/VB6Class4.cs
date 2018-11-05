/**
 * @file VB6Class4.cls
 * \brief Single VB6 class module, defining VB6Class4
 */
namespace vb6 {
	 /**
	 *  <summary>
	 *  VB6 class example
	 *  </summary>
	 *  \file VB6Class4.cls
	 *  \remarks The original unfiltered source of this file: <A HREF="https://github.com/sevoku/doxygen-vb-filter/blob/master/samples/ClassicVB/VB6Class4.cls">VB6Class4.cls</A>
	 */
	class VB6Class4
	{
		/**
		 *  External declaration for win32 function
		 */
		/** \remark Is imported from external library: kernel32 */
		private extern  long GetPrivateProfileStringA(string strSection, string strKey, string strDefault, string strReturnedString, long lngSize, string strFileNameName);
		/**
		 *  External declaration for win32 function
		 */
		/** \remark Is imported from external library: oleaut32.dll */
		private extern  long SafeArrayGetDim(ref Any[] pArray);
	}
}
