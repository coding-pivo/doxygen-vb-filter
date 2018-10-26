/**
 * @file VBAClass4.cls
 * \brief Single VB6 class module, defining VBAClass4
 */
namespace vba {
	 /**
	 *  <summary>
	 *  VBA class example
	 *  </summary>
	 *  \file VBAClass4.cls
	 *  \remarks The original unfiltered source of this file: <A HREF="https://github.com/sevoku/doxygen-vb-filter/blob/master/samples/ClassicVB/VBAClass4.cls">VBAClass4.cls</A>
	 */
	class VBAClass4
	{
		private enum SampleEnum
		{
			[_First] = 0,
			enumItem1 = 0,
			enumItem2 = 1,
			enumItem3 = 2,
			[_Last] = 2
		}
		private struct SampleType1
		{
			long typeItem1;
			double typeItem2;
		}
	}
}
