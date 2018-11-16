/** \file */
namespace vbnet {
	/**
	 *  <summary>example file demonstrating interfaces and classes</summary>
	 *  <remarks>detailed file description comes here<BR><BR>
	 *  The original unfiltered source of this file : <A HREF="http://trac.sevo.org/projects/doxyvb/browser/trunk/samples/DotNET/class_with_interface.vb">class_with_interface.vb</A></remarks>
	 */
	using SysIO = System.IO;
	using System.Threading;
	using SysSerial = System.Runtime.Serialization;
	/**
	 *  <summary>
	 *  simple enumeration
	 *  </summary>
	 *  <remarks>description of the simple enumeration</remarks>
	 */
	public enum SampleEnum
	{
		Value1, /**< \brief  first value */
		/**
		 *  <summary>
		 *  second value
		 *  </summary>
		 */
		Value2,
		Value3 = 1234, /**< \brief  third assigned value */
		Value4 /**< \brief  fourth value */
	}
	/**
	 *  <summary>
	 *  sample interface
	 *  </summary>
	 *  <remarks>interface inherits IDisposable</remarks>
	 */
	public interface ISample
	: IDisposable
	{
		/**
		 *  <summary>
		 *  simple property
		 *  </summary>
		 *  <value>returns a string value</value>
		 */
		string StringProperty
		{ get; set; }
		/**
		 *  <summary>
		 *  read only property
		 *  </summary>
		 *  <value>returns an Integer value</value>
		 */
		int IntegerProperty
		{ get; }
		/**
		 *  <summary>
		 *  simple method
		 *  </summary>
		 *  <remarks>no remarks</remarks>
		 */
		void SampleMethod();
		/**
		 *  <summary>
		 *  simple method with parameters
		 *  </summary>
		 *  <param name="pFirst">first parameter is a String</param>
		 *  <param name="pPointer">second parameter is a pointer to an Integer</param>
		 *  <remarks></remarks>
		 */
		void SampleMethodWithParams(string pFirst, ref int pPointer);
		/**
		 *  <summary>
		 *  simple function with a parameter
		 *  </summary>
		 *  <param name="pFirst">Double parameter</param>
		 *  <returns>a Double value</returns>
		 *  <remarks></remarks>
		 */
		 double SampleFunction(double pFirst);
		/**
		 *  <summary>
		 *  simple event with a parameter
		 *  </summary>
		 *  <param name="Sender">event sender object</param>
		 */
		event OnSomeEvent(object Sender);
	}
	/**
	 *  <summary>
	 *  simple class implementing an interface
	 *  </summary>
	 *  <remarks>Implements ISample</remarks>
	 */
	public class SampleClass
	: ISample
	{
		/**
		 *  <summary>
		 *  nested class declared inside SampleClass
		 *  </summary>
		 */
		public class NestedClass
		: object
		{
			public string someString ; /**< \brief simple public string value */
			/**
			 *  <summary>
			 *  some event
			 *  </summary>
			 *  <param name="Sender">sender of object type</param>
			 */
			/**
			 *  <param name="args">event arguments</param>
			 *  <remarks></remarks>
			 */
			public event SomeEvent(object Sender, EventArgs args);
		}
		private int someInteger ; /**< \brief simple private integer value */
		public long[] longArray ; /**< \brief long array */ 
		public string someString ; /**< \brief simple public string value */
		public NestedClass nestedClassObject ; /**< \brief NestedClass instance */
		/**
		 *  <summary>
		 *  simple property
		 *  </summary>
		 *  <value>some string</value>
		 *  <returns>some string</returns>
		 */
		public string StringProperty /** Implements <see cref="ISample.StringProperty"/> */
		{ get; set; }
		/**
		 *  <summary>
		 *  readonly property
		 *  </summary>
		 *  <value>integer value</value>
		 *  <returns>same interger value</returns>
		 */
		public int IntegerProperty /** Implements <see cref="ISample.IntegerProperty"/> */
		{ get; }
		/**
		 *  <summary>
		 *  function with parameter
		 *  </summary>
		 *  <param name="pFirst">simple parameter</param>
		 *  <returns>some double value</returns>
		 *  <remarks></remarks>
		 */
		public  double SampleFunction(double pFirst) ; /**< Implements <see cref="ISample.SampleFunction"/> */
		/**
		 *  <summary>
		 *  function with arrays
		 *  </summary>
		 *  <param name="pFirst">double array as parameter</param>
		 *  <returns>double array</returns>
		 *  <remarks></remarks>
		 */
		public  double[] SampleFunction2(double[] pFirst);
		/**
		 *  <summary>
		 *  simple operator
		 *  </summary>
		 *  <param name="Obj1">first simple object</param>
		 *  <param name="Obj2">second simple object</param>
		 *  <returns>True if Obj1 equal to, or bigger than Obj2</returns>
		 */
		public static bool operator +(SampleClass Obj1, SampleClass Obj2);
		/**
		 *  <summary>
		 *  shared/static function
		 *  </summary>
		 *  <returns>a String value</returns>
		 */
		static  string SampleFunction();
		/**
		 *  <summary>
		 *  simple method
		 *  </summary>
		 *  <remarks></remarks>
		 */
		public void SampleMethod() ; /**< Implements <see cref="ISample.SampleMethod"/> */
		/**
		 *  <summary>
		 *  method with parameters
		 *  </summary>
		 *  <param name="pFirst">simple param</param>
		 *  <param name="pPointer">pinter</param>
		 *  <remarks></remarks>
		 */
		public void SampleMethodWithParams(string pFirst, ref int pPointer) ; /**< Implements <see cref="ISample.SampleMethodWithParams"/> */
		/**
		 *  <summary>
		 *  method with an array as param
		 *  </summary>
		 *  <param name="pArr">integer array</param>
		 *  <param name="pArg">simple parameter</param>
		 *  <remarks></remarks>
		 */
		public void MethodWithArrayParams(int[] pArr, int pArg);
		/**
		 *  <summary>
		 *  method handles event from nested class
		 *  </summary>
		 */
		/// \remark Handles the nestedClassObject.SomeEvent event.
		public void nestedClassObject_OnSomeEvent(object Sender, EventArgs args);
		/**
		 *  <summary>
		 *  some event
		 *  </summary>
		 *  <param name="Sender">sender of object type</param>
		 *  <remarks></remarks>
		 */
		public event OnSomeEvent(object Sender) ; /**< Implements <see cref="ISample.OnSomeEvent"/> */
		private bool disposedValue = False ; /**< \brief generated by VS class designer */
		/**
		 *  <summary>
		 *  IDisposable implementation
		 *  </summary>
		 *  <param name="disposing"></param>
		 *  <remarks>Is called from default Dispose method.</remarks>
		 */
		protected virtual void Dispose(bool disposing);
		/**
		 *  <summary>
		 *  IDisposable implementation
		 *  </summary>
		 *  <remarks></remarks>
		 */
		public void Dispose() ; /**< Implements <see cref="IDisposable.Dispose"/> */
	}
}
