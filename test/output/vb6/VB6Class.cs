/**
 * @file VB6Class.cls
 * \brief Single VB6 class module, defining VB6Class
 */
namespace vb6 {
	 /**
	 *  <summary>
	 *  VB6 class example
	 *  </summary>
	 *  \file VB6Class.cls
	 *  \remarks The original unfiltered source of this file: <A HREF="https://github.com/sevoku/doxygen-vb-filter/blob/master/samples/ClassicVB/VB6Class.cls">VB6Class.cls</A>
	 */
	class VB6Class
	private enum SampleEnum
	{
		[_First] = 1,
		enumItem1 = 1,
		enumItem2 = 2,
		enumItem3 = 3,
		[_Last] = 3
	}
	{
		private struct SampleType1
		{
		}
		/**
		 *  Sample private type within a class
		 */
		private struct SampleType2
		{
		}
		private struct SampleType3
		{
		}
		private int someInteger ; /**< \brief simple private integer value */
		public string someString ; /**< \brief simple public string value */
		private object someObject ; /**< \brief some object */
		/**
		 *  <summary>
		 *  simple property
		 *  </summary>
		 *  <value>some string</value>
		 *  <returns>some string</returns>
		 */
		public string StringProperty
		{ get; set; }
		/**
		 *  <summary>
		 *  readonly property
		 *  </summary>
		 *  <value>integer value</value>
		 *  <returns>some integer value</returns>
		 */
		public int IntegerProperty
		{ get; }
		/**
		 *  <summary>
		 *  reference property
		 *  </summary>
		 *  <value>some object</value>
		 *  <returns>some object</returns>
		 */
		public object ObjectProperty
		{ get; set; }
		/**
		 *  <summary>
		 *  not working property
		 *  </summary>
		 *  <remarks>
		 *  this property will be seen as ReadOnly by the Doxygen vbfilter
		 *  because Set does not precede get!
		 *  </remarks>
		 */
		public object TestProperty
		{ get; }
		/**
		 *  <summary>
		 *  function with parameter
		 *  </summary>
		 *  <param name="pFirst">simple parameter</param>
		 *  <returns>some double value</returns>
		 *  <remarks></remarks>
		 */
		public  double SampleFunction(double pFirst);
		/**
		 *  <summary>
		 *  function with an array as parameter
		 *  </summary>
		 *  <param name="arg1">simple long parameter</param>
		 *  <param name="arg2">String array</param>
		 *  <returns>some long value</returns>
		 *  <remarks></remarks>
		 */
		public  long SampleFunction2(long arg1, string[] arg2);
		/**
		 *  <summary>
		 *  function with an array as result
		 *  </summary>
		 *  <param name="arg1">simple long parameter</param>
		 *  <returns>long array</returns>
		 *  <remarks></remarks>
		 */
		public  long[] SampleFunction3(long arg1);
		/**
		 *  <summary>
		 *  simple method
		 *  </summary>
		 *  <remarks></remarks>
		 */
		void SampleMethod();
		/**
		 *  <summary>
		 *  method with parameters
		 *  </summary>
		 *  <param name="pFirst">simple param</param>
		 *  <param name="pPointer">pointer</param>
		 *  <remarks></remarks>
		 */
		public void SampleMethodWithParams(string pFirst, ref int pPointer);
		If d = 2 Then Exit void Else d = 3;
		/**
		 *  <summary>
		 *  simple constructor
		 *  </summary>
		 *  <remarks></remarks>
		 */
		private void Class_Initialize();
		s = "This is a  as example";
		/**
		 *  <summary>
		 *  some event
		 *  </summary>
		 *  <param name="Sender">sender of object type</param>
		 *  <remarks></remarks>
		 */
		public event OnSomeEvent(object Sender);
		/**
		 *  <summary>
		 *  destruction event
		 *  </summary>
		 */
		event Destroy();
		/**
		 *  <summary>
		 *  simple destructor
		 *  </summary>
		 *  <remarks>Raises Destroy event</remarks>
		 */
		private void Class_Terminate();
	}
}
