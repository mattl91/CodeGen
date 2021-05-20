<CODEGEN_FILENAME>frm<WindowName>.Designer.cs</CODEGEN_FILENAME>
;//****************************************************************************
;//
;// Title:       cs_winform_codebehind.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: This template generates the code-behind file for a C# windows
;//              form which represents a Synergy Repository structure.
;//
;// Date:        19th March 2007
;//
;// Author:      Steve Ives, Synergex Professional Services Group
;//              http://www.synergex.com
;//
;//****************************************************************************
;//
;// Copyright (c) 2012, Synergex International, Inc.
;// All rights reserved.
;//
;// Redistribution and use in source and binary forms, with or without
;// modification, are permitted provided that the following conditions are met:
;//
;// * Redistributions of source code must retain the above copyright notice,
;//   this list of conditions and the following disclaimer.
;//
;// * Redistributions in binary form must reproduce the above copyright notice,
;//   this list of conditions and the following disclaimer in the documentation
;//   and/or other materials provided with the distribution.
;//
;// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
;// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;// POSSIBILITY OF SUCH DAMAGE.
;//
//*****************************************************************************
//
// Title:       frm<WindowName>.Designer.cs
//
// Author:      <AUTHOR>
//
// Company:     <COMPANY>
//
//*****************************************************************************
//
// WARNING:     This code was generated by CodeGen. Any changes that you make
//              to this file will be lost if the code is regenerated.
//
//*****************************************************************************
//
using System.Windows.Forms;

partial class frm<WindowName>
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

;//
;//=============================================================================
;//Instantiate controls
;//
    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
<FIELD_LOOP>
  <IF TEXTBOX>
    <IF PROMPT>
        this.lbl<Field_sqlname> = new System.Windows.Forms.Label();
    </IF>
        this.txt<Field_sqlname> = new System.Windows.Forms.TextBox();
    <IF DRILL>
        this.btn<Field_sqlname> = new System.Windows.Forms.Button();
    </IF>
  <ELSE CHECKBOX>
        this.chk<Field_sqlname> = new System.Windows.Forms.CheckBox();
  <ELSE COMBOBOX>
    <IF PROMPT>
        this.lbl<Field_sqlname> = new System.Windows.Forms.Label();
    </IF>
        this.cbo<Field_sqlname> = new System.Windows.Forms.ComboBox();
  <ELSE RADIOBUTTONS>
        //RADIOBUTTONS ARE NOT SUPPORTED YET!
</FIELD_LOOP>
        this.buttonPanel = new System.Windows.Forms.FlowLayoutPanel();
        this.btnOK = new System.Windows.Forms.Button();
        this.btnCancel = new System.Windows.Forms.Button();
        this.buttonPanel.SuspendLayout();
        this.SuspendLayout();

;//
;//=============================================================================
;//Configure controls controls
;//
<FIELD_LOOP>
;//
;//=============================================================================
;//TextBox code
;//
  <IF TEXTBOX>
    <IF PROMPT>
        //
        //lbl<Field_sqlname>
        this.lbl<Field_sqlname>.AutoSize = true;
        this.lbl<Field_sqlname>.Location = new System.Drawing.Point(<PROMPT_PIXEL_COL>,<PROMPT_PIXEL_ROW>);
        this.lbl<Field_sqlname>.Name = "lbl<Field_sqlname>";
        this.lbl<Field_sqlname>.TabIndex = 0;
        this.lbl<Field_sqlname>.Text = "<FIELD_PROMPT>";
    </IF>
        //
        //txt<Field_sqlname>
        this.txt<Field_sqlname>.Location = new System.Drawing.Point(<FIELD_PIXEL_COL>,<FIELD_PIXEL_ROW>);
        this.txt<Field_sqlname>.Name = "txt<Field_sqlname>";
        this.txt<Field_sqlname>.TabIndex = <FIELD#LOGICAL>;
        this.txt<Field_sqlname>.MaxLength = <FIELD_SIZE>;
        this.txt<Field_sqlname>.Size = new System.Drawing.Size(<FIELD_PIXEL_WIDTH>,20);
        this.txt<Field_sqlname>.Leave += new System.EventHandler(this.txt<Field_sqlname>_Leave);
    <IF DISABLED>
        this.txt<Field_sqlname>.Enabled = false;
    </IF>
    <IF READONLY>
        this.txt<Field_sqlname>.ReadOnly = true;
    </IF>
    <IF UPPERCASE>
        this.txt<Field_sqlname>.CharacterCasing = CharacterCasing.Upper;
    </IF>
    <IF REVERSE>
        this.txt<Field_sqlname>.BackColor = Color.Black;
        this.txt<Field_sqlname>.ForeColor = Color.White;
    </IF>
    <IF DEFAULT>
        this.txt<Field_sqlname>.Text = "<FIELD_DEFAULT>";
    </IF>
    <IF NOECHO>
        this.txt<Field_sqlname>.PasswordChar = "*";
    </IF>
    <IF DRILL>

        //Btn<Field_sqlname>
        this.btn<Field_sqlname>.Name = "Btn<Field_sqlname>";
        this.btn<Field_sqlname>.Location =  new System.Drawing.Point(<FIELD_DRILL_PIXEL_COL>,<FIELD_PIXEL_ROW>);
        this.btn<Field_sqlname>.Size = new System.Drawing.Size(24,20);
        this.btn<Field_sqlname>.Text = "...";
        this.btn<Field_sqlname>.Click += new System.EventHandler(this.btn<Field_sqlname>_Click);
    </IF>
;//
;//=============================================================================
;//CheckBox code
;//
  <ELSE CHECKBOX>
        //
        //chk<Field_sqlname>
        this.chk<Field_sqlname>.Name = "chk<Field_sqlname>";
        this.chk<Field_sqlname>.Location = new System.Drawing.Point(<FIELD_PIXEL_COL>,<FIELD_PIXEL_ROW>);
        this.chk<Field_sqlname>.Size = new System.Drawing.Size(<FIELD_PIXEL_WIDTH>, 17);
        this.chk<Field_sqlname>.AutoSize = true;
        this.chk<Field_sqlname>.TabIndex = <FIELD#LOGICAL>;
        this.chk<Field_sqlname>.UseVisualStyleBackColor = true;
        this.chk<Field_sqlname>.Text = "<FIELD_PROMPT>";
    <IF DISABLED>
        this.chk<Field_sqlname>.Enabled = false;
    </IF>
    <IF DEFAULT>
        ;//this.chk<Field_sqlname>.Checked = true
        ;//this.chk<Field_sqlname>.CheckState = System.Windows.Forms.CheckState.Checked
    </IF>
;//
;//=============================================================================
;//ComboBox code
;//
  <ELSE COMBOBOX>
    <IF PROMPT>
        //
        //lbl<Field_sqlname>
        this.lbl<Field_sqlname>.Name = "lbl<Field_sqlname>";
        this.lbl<Field_sqlname>.Location = new System.Drawing.Point(<PROMPT_PIXEL_COL>,<PROMPT_PIXEL_ROW>);
        this.lbl<Field_sqlname>.AutoSize = true;
        this.lbl<Field_sqlname>.TabIndex = 0;
        this.lbl<Field_sqlname>.Text = "<FIELD_PROMPT>";
    </IF>
        //
        //cbo<Field_sqlname>
        this.cbo<Field_sqlname>.Name = "cbo<Field_sqlname>";
        this.cbo<Field_sqlname>.Location = new System.Drawing.Point(<FIELD_PIXEL_COL>,<FIELD_PIXEL_ROW>);
        this.cbo<Field_sqlname>.Size = new System.Drawing.Size(<FIELD_PIXEL_WIDTH>, 21);
        this.cbo<Field_sqlname>.TabIndex = <FIELD#LOGICAL>;
        this.cbo<Field_sqlname>.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
        this.cbo<Field_sqlname>.FormattingEnabled = true;
    <IF DISABLED>
        this.cbo<Field_sqlname>.Enabled = false;
    </IF>
        this.cbo<Field_sqlname>.Items.AddRange(getComboItems(<FIELD_SELECTIONS>));
;//
;//=============================================================================
;//RadioButtons code
;//
  <ELSE RADIOBUTTONS>
        //
        //rb<Field_sqlname>
        //
        //RADIOBUTTONS ARE NOT SUPPORTED YET!
        //
  </IF>
;//
;//
;//=============================================================================
;//
</FIELD_LOOP>
        //
        // buttonPanel
        //
        this.buttonPanel.Controls.Add(this.btnCancel);
        this.buttonPanel.Controls.Add(this.btnOK);
        this.buttonPanel.Dock = System.Windows.Forms.DockStyle.Bottom;
        this.buttonPanel.FlowDirection = System.Windows.Forms.FlowDirection.RightToLeft;
        this.buttonPanel.Location = new System.Drawing.Point(0, 470);
        this.buttonPanel.Name = "buttonPanel";
        this.buttonPanel.Size = new System.Drawing.Size(800, 30);
        this.buttonPanel.TabIndex = 100;
        //
        // btnOK
        //
        this.btnOK.Name = "btnOK";
        this.btnOK.Text = "&OK";
        this.btnOK.TabIndex = 101;
        this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
        //
        // btnCancel
        //
        this.btnCancel.Name = "btnCancel";
        this.btnCancel.Text = "&Cancel";
        this.btnCancel.TabIndex = 102;
        this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
        this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
        //
        // frm<WindowName>
        //
        this.Name = "frm<WindowName>";
        this.Text = "<STRUCTURE_DESC> Maintenance";
        this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
        this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
        this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
        this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
        this.ClientSize = new System.Drawing.Size(<WINDOW_WIDTHPX>, <WINDOW_HEIGHTPX>);
        this.MaximizeBox = false;
        this.MinimizeBox = false;
        this.Load += new System.EventHandler(this.frm<WindowName>_Load);
;//
;//=============================================================================
;//Add controls to the form
;//

        this.Controls.Add(this.buttonPanel);
<FIELD_LOOP>
  <IF TEXTBOX>
    <IF PROMPT>
        this.Controls.Add(this.lbl<Field_sqlname>);
    </IF>
        this.Controls.Add(this.txt<Field_sqlname>);
    <IF DRILL>
        this.Controls.Add(this.btn<Field_sqlname>);
    </IF>
  <ELSE CHECKBOX>
        this.Controls.Add(this.chk<Field_sqlname>);
  <ELSE COMBOBOX>
    <IF PROMPT>
        this.Controls.Add(this.lbl<Field_sqlname>);
    </IF>
        this.Controls.Add(this.cbo<Field_sqlname>);
  <ELSE RADIOBUTTONS>
        //RADIOBUTTONS ARE NOT SUPPORTED YET!
  </IF>
</FIELD_LOOP>

        this.buttonPanel.ResumeLayout(false);
        this.ResumeLayout(false);
        this.PerformLayout();
    }

    #endregion

;//
;//=============================================================================
;//Declare object variables for controls
;//
<FIELD_LOOP>
  <IF TEXTBOX>
    <IF PROMPT>
    private System.Windows.Forms.Label lbl<Field_sqlname>;
    </IF>
    private System.Windows.Forms.TextBox txt<Field_sqlname>;
    <IF DRILL>
    private System.Windows.Forms.Button btn<Field_sqlname>;
    </IF>
  <ELSE CHECKBOX>
    private System.Windows.Forms.CheckBox chk<Field_sqlname>;
  <ELSE COMBOBOX>
    <IF PROMPT>
    private System.Windows.Forms.Label lbl<Field_sqlname>;
    </IF>
    private System.Windows.Forms.ComboBox cbo<Field_sqlname>;
  <ELSE RADIOBUTTONS>
    //RADIOBUTTONS ARE NOT SUPPORTED YET!
  </IF>
</FIELD_LOOP>
    private System.Windows.Forms.FlowLayoutPanel buttonPanel;
    private System.Windows.Forms.Button btnOK;
    private System.Windows.Forms.Button btnCancel;

}
