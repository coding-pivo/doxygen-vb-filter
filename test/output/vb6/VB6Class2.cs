/**
 * @file VB6Class2.cls
 * \brief Single VB6 class module, defining VB6Class2
 */
namespace vb6 {
	 /**
	 *  <summary>
	 *  VB6 class example
	 *  </summary>
	 *  \file VB6Class2.cls
	 *  \remarks The original unfiltered source of this file: <A HREF="https://github.com/sevoku/doxygen-vb-filter/blob/master/samples/ClassicVB/VB6Class2.cls">VB6Class2.cls</A>
	 */
	class VB6Class2
	{
		private struct SampleType1
		{
			long typeItem1; 
			long typeItem2; 
		}
		private enum SampleEnum
		{
			[_First] = 1,
			enumItem1 = 1,
			enumItem2 = 2,
			enumItem3 = 3,
			[_Last] = 3
		}
	}
}