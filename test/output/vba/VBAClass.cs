/**
 * @file VBAClass.cls
 * \brief Single VB6 class module, defining VBAClass1
 */
namespace vba {
	 /**
	 *  <summary>
	 *  VBA class example
	 *  </summary>
	 *  \file VBAClass1.cls
	 *  \remarks The original unfiltered source of this file: <A HREF="https://github.com/sevoku/doxygen-vb-filter/blob/master/test/input/vba/VBAClass1.cls">VBAClass1.cls</A>
	 */
	class VBAClass1
	{
		/**
		 *  External declaration for win32 function
		 */
		/** Is imported from extern library: kernel32 */
		private extern  long GetPrivateProfileStringA(string strSection, string strKey, string strDefault, string strReturnedString, long lngSize, string strFileNameName);
		/**
		 *  External declaration for win32 function
		 */
		/** Is imported from extern library: oleaut32.dll */
		private extern  long SafeArrayGetDim(ref Any[] pArray);
	}
}
