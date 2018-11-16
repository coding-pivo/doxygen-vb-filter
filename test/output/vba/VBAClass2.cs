/** \file */
namespace vba {
	class VBAClass2
	{
		/**
		 *  <summary>
		 *  VBA class example
		 *  </summary>
		 *  \file VBAClass2.cls
		 *  \remarks The original unfiltered source of this file: <A HREF="https://github.com/sevoku/doxygen-vb-filter/blob/master/test/input/vba/VBAClass2.cls">VBAClass2.cls</A>
		 */
		/** \remark Is imported from external library: kernel32 */
		private extern  long GetPrivateProfileStringA(string strSection, string strKey, string strDefault, string strReturnedString, long lngSize, string strFileNameName);
		/** \remark Is imported from external library: oleaut32.dll */
		private extern  long SafeArrayGetDim(ref Any[] pArray);
	}
}
