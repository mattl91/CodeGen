<CODEGEN_FILENAME>Update<StructureName>.dbl</CODEGEN_FILENAME>
<REQUIRES_USERTOKEN>XF_INTERFACE</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>XF_ELB</REQUIRES_USERTOKEN>
<PROCESS_TEMPLATE>xf_java_validate.tpl</PROCESS_TEMPLATE>
;//****************************************************************************
;//
;// Title:       xf_java_update.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: This template generates a Synergy method suitable for use
;//              with xfServerPlus and xfNetLink Java. The method updates an
;//              existing record in an ISAM file.
;//
;// Date:        22nd March 2010
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
;;*****************************************************************************
;;
;; File:        Update<StructureName>.dbl
;;
;; Description: Updates an existing <STRUCTURE_NAME> record
;;
;; Type:        Synergy/DE xfServerPlus Method
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
;;
.ifndef str<StructureName>
.include "<STRUCTURE_NOALIAS>" repository, structure="str<StructureName>", end
.endc

{xfMethod(interface="<XF_INTERFACE>",elb="<XF_ELB>")}
function Update<StructureName>, ^val

    {xfParameter(name="<StructureName>")}
    required in a<StructureName>, str<StructureName>

    endparams

    stack record local_data
        retVal, int
        ch<StructureName>, int
        new<StructureName>, str<StructureName>
        old<StructureName>, str<StructureName>
    endrecord

    external function
        Validate<StructureName>, ^val
    endexternal

proc

    init local_data

    if (retVal=Validate<StructureName>(new<StructureName>=a<StructureName>))
    begin
        try
        begin
            open(ch<StructureName>=syn_freechn(),u:i,"<FILE_NAME>")
            read(ch<StructureName>,old<StructureName>,new<StructureName>.<primary_key_field>)
            write(ch<StructureName>,new<StructureName>)
        end
        catch (ex)
        begin
            retVal = false
        end
        finally
        begin
            if (ch<StructureName>&&chopen(ch<StructureName>))
                close ch<StructureName>
        end
        endtry
    end

    freturn retVal

endfunction
