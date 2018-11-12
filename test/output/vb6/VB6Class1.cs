/**
 * @file VB6Class1.cls
 * \brief Single VB6 class module, defining VB6Class1
 */
namespace vb6 {
	 /**
	 *  <summary>
	 *  VB6 class example
	 *  </summary>
	 *  \file VB6Class1.cls
	 *  \remarks The original unfiltered source of this file: <A HREF="https://github.com/sevoku/doxygen-vb-filter/blob/master/samples/ClassicVB/VB6Class1.cls">VB6Class1.cls</A>
	 */
	class VB6Class1
	{
		private enum SampleEnum
		{
			[_First] = 1,
			enumItem1 = 1,
			enumItem2 = 2,
			enumItem3 = 3,
			[_Last] = 3
		}
		private struct SampleType1
		{
			long typeItem1; 
			long typeItem2; 
		}
		/**
		 *  Sample private type within a class
		 */
		private struct SampleType2
		{
			long typeItem1; 
			long typeItem2; 
		}
		private struct SampleType3
		{
			long typeItem1; 
			long typeItem2; 
		}
		private int someIntegerPublic ; /**< \brief simple private integer value */
		public string someStringPrivate ; /**< \brief simple public string value */
		private object someObjectProtected ; /**< \brief some private object */
		private double someDoubleFriend ; /**< \brief some private double value */
		public float someSingleShared ; /**< \brief some public single value */
		public bool someBooleanImports ; /**< \brief some public boolean value */
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
		/**
		 *  <summary>
		 *  simple constructor
		 *  </summary>
		 *  <remarks></remarks>
		 */
		private void Class_Initialize();
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
