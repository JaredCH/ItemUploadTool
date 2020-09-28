namespace ItemUploadTool
{
    partial class Form4
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.picImageViewerOnForm4 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.picImageViewerOnForm4)).BeginInit();
            this.SuspendLayout();
            // 
            // picImageViewerOnForm4
            // 
            this.picImageViewerOnForm4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.picImageViewerOnForm4.Image = global::ItemUploadTool.Properties.Resources.COMMCLASS;
            this.picImageViewerOnForm4.Location = new System.Drawing.Point(0, 0);
            this.picImageViewerOnForm4.Name = "picImageViewerOnForm4";
            this.picImageViewerOnForm4.Size = new System.Drawing.Size(884, 302);
            this.picImageViewerOnForm4.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picImageViewerOnForm4.TabIndex = 0;
            this.picImageViewerOnForm4.TabStop = false;
            // 
            // Form4
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(884, 302);
            this.Controls.Add(this.picImageViewerOnForm4);
            this.Name = "Form4";
            this.Text = "Comm Class Code";
            this.Load += new System.EventHandler(this.Form4_Load);
            ((System.ComponentModel.ISupportInitialize)(this.picImageViewerOnForm4)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox picImageViewerOnForm4;
    }
}