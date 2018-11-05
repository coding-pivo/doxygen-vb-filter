/**
 * @file VB6Control.ctl
 * \brief Single VB6 class module, defining VB6Control
 */
namespace vb6 {
	 /**
	 *  \brief Custom VB6 User Control
	 *  \remarks this example contains auto generated code by Visual Studio 6.0
	 *           and additional comments as example
	 */
	class VB6Control
	{
		/**
		 *  \file VB6Control.ctl
		 *  \remarks The original unfiltered source of this file: <A HREF="http://trac.sevo.org/projects/doxyvb/browser/trunk/samples/ClassicVB/VB6Control.ctl">VB6Control.ctl</A>
		 */
		const m_def_BackColor = 0 ; /**< \brief  some constant */
		const m_def_ForeColor = 0 ; /**< \brief  an other example inline comment */
		const m_def_Enabled = 0;
		const m_def_BackStyle = 0;
		const m_def_BorderStyle = 0;
		event Click();
		event DblClick();
		event KeyDown(int KeyCode, int Shift);
		event KeyPress(int KeyAscii);
		event KeyUp(int KeyCode, int Shift);
		event MouseDown(int Button, int Shift, float X, float Y);
		event MouseMove(int Button, int Shift, float X, float Y);
		event MouseUp(int Button, int Shift, float X, float Y);
		public long BackColor
		{ get; }
		public long ForeColor
		{ get; set; }
		public bool Enabled
		{ get; set; }
		public Font Font
		{ get; set; }
		public int BackStyle
		{ get; set; }
		public int BorderStyle
		{ get; set; }
		public void Refresh();
		private void UserControl_InitProperties();
		private void UserControl_ReadProperties(PropertyBag PropBag);
		private void UserControl_WriteProperties(PropertyBag PropBag);
	}
}