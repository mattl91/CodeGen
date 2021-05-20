<CODEGEN_FILENAME><structure_name>_change.dbl</CODEGEN_FILENAME>
<PROCESS_TEMPLATE>tk_io.tpl</PROCESS_TEMPLATE>
;//****************************************************************************
;//
;// Title:       tk_change.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: This template generates a UI Toolkit change method
;//
;// Date:        19th March 2007
;//
;// Author:      Richard C. Morris, Synergex Professional Services Group
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
;;*****************************************************************************
;;
;; Routine:     <structure_name>_change
;;
;; Author:      <AUTHOR>
;;
;; Company:     <COMPANY>
;;
;;*****************************************************************************
;;
;; WARNING:     This code was generated by CodeGen. Any changes that you make
;;              to this file will be lost if the code is regenerated.
;;
;;*****************************************************************************

function <structure_name>_change ,^val ,reentrant

    ;Argument list

    a_data_entered      ,a
    a_data_stored       ,a
    a_pending_status    ,n
    .include "WND:inpinf.def"
    a_inprec            ,a

    endparams

    .include "WND:tools.def"
    .include "WND:system.def"
    .include "WND:fldinf.def"
    .include "CODEGEN_INC:structure_io.def"

    external function
        <Structure_Name>Io      ,^val
    endexternal

    .include "<STRUCTURE_NOALIAS>" repository, stack record="<structure_name>"

    stack record ivars
        io_error            ,i4     ;An io error occurred
        retval              ,i4     ;Function return value
        count               ,i4     ;Loop counter
        fieldnumber         ,i4     ;Field number of display field
        idf_<structure_name>_i   ,i4     ;Local channel number for master file
    endrecord

    stack record avars
        fieldname           ,a30    ;Name of extended display field
    endrecord

    global data section DISPLAY_LOCAL_FIELDS_DATA
        record
            dlf_dispfld ,a30        ;Used to propagate current field name from
                                    ;the DISPLAY_LOCAL_FIELDS routine.
        endrecord
    endglobal

proc
    clear ^i(ivars), avars
    retval = a_pending_status

    if (retval==D_OK)
    begin

        io_error = <Structure_Name>Io(IO_OPEN_INP,idf_<structure_name>_i)

        if (io_error==IO_OK) then
        begin
            clear <structure_name>
            <structure_name>.<PRIMARY_KEY_FIELD> = a_data_stored

            if ((io_error=<Structure_Name>Io(IO_READ,idf_<structure_name>_i,,0,<structure_name>))==IO_OK) then
            begin
                ;Record was found. If there is an extended display field in the
                ;window then display the description to it
                if (inp_fldnam) then
                    fieldname = %atrim(%i_getstring(inp_wndid,inp_fldnam)) + "_DSP"
                else
                    fieldname = %atrim(dlf_dispfld) + "_DSP"

                xcall i_fldinf(inp_wndid,fieldname,fieldnumber=0)
                if (fieldnumber)
                    xcall i_dspfld(inp_wndid,fieldname,<structure_name>.<DISPLAY_FIELD>)
            end
            else
            begin
                xcall u_message('Record not found')
                retval = D_EMITTEDERR
            end

            ;Close the master file
            io_error = <Structure_Name>Io(IO_CLOSE,idf_<structure_name>_i)
        end
        else
        begin
            xcall u_msgbox("Error opening file <FILE_NAME>",D_MOK+D_MICONEXCLAM,"Error")
            xcall <Structure_Name>Io(IO_SHOWERR)
            retval = D_EMITTEDERR
        end
    end

    freturn retval

endfunction
