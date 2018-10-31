/**
 * @file 

 * \brief Single VB6 class module, defining Order
 */
namespace vb6 {
	class Order
	{
		private string mOrderID;
		private string mOrderDate;
		public  string SaveOrder();
		public string OrderID
		{ get; set; }
		public string OrderDate
		{ get; set; }
	}
}
