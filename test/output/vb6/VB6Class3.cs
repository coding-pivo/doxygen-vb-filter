/**
 * @file VB6Class3.cls
 * \brief Single VB6 class module, defining VB6Class3
 */
namespace vb6 {
	 /**
	 *  <summary>
	 *  VB6 class example
	 *  </summary>
	 *  \file VB6Class3.cls
	 *  \remarks The original unfiltered source of this file: <A HREF="https://github.com/sevoku/doxygen-vb-filter/blob/master/samples/ClassicVB/VB6Class3.cls">VB6Class3.cls</A>
	 */
	class VB6Class3
	{
		/** Is imported from extern library: kernel32 */
		private extern  long GetPrivateProfileStringA(string strSection, string strKey, string strDefault, string strReturnedString, long lngSize, string strFileNameName);
		/** Is imported from extern library: oleaut32.dll */
		private extern  long SafeArrayGetDim(ref Any[] pArray);
	}
}
