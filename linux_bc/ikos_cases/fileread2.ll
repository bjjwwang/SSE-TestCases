; ModuleID = 'linux_bc/ikos_cases/fileread2.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/ikos_cases/fileread2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !11 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %fptr = alloca %struct._IO_FILE*, align 8
  %str = alloca [60 x i8], align 16
  %bitsRead = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !19, metadata !DIExpression()), !dbg !20
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fptr, metadata !23, metadata !DIExpression()), !dbg !83
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 0, !dbg !84
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !84
  %call = call %struct._IO_FILE* @fopen(i8* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !85
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fptr, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata [60 x i8]* %str, metadata !87, metadata !DIExpression()), !dbg !91
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fptr, align 8, !dbg !92
  %cmp = icmp eq %struct._IO_FILE* %2, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %fptr, align 8, !dbg !96
  %cmp1 = icmp eq %struct._IO_FILE* %3, null, !dbg !98
  %conv = zext i1 %cmp1 to i32, !dbg !98
  %call2 = call i32 (i32, ...) bitcast (i32 (...)* @svf_assert to i32 (i32, ...)*)(i32 %conv), !dbg !99
  call void @exit(i32 1) #4, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %entry
  %arraydecay = getelementptr inbounds [60 x i8], [60 x i8]* %str, i64 0, i64 0, !dbg !101
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %fptr, align 8, !dbg !103
  %call3 = call i8* @fgets(i8* %arraydecay, i32 60, %struct._IO_FILE* %4), !dbg !104
  %cmp4 = icmp ne i8* %call3, null, !dbg !105
  br i1 %cmp4, label %if.then6, label %if.end9, !dbg !106

if.then6:                                         ; preds = %if.end
  %arraydecay7 = getelementptr inbounds [60 x i8], [60 x i8]* %str, i64 0, i64 0, !dbg !107
  %call8 = call i32 @puts(i8* %arraydecay7), !dbg !109
  br label %if.end9, !dbg !110

if.end9:                                          ; preds = %if.then6, %if.end
  call void @llvm.dbg.declare(metadata i32* %bitsRead, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay10 = getelementptr inbounds [60 x i8], [60 x i8]* %str, i64 0, i64 0, !dbg !113
  %call11 = call i64 @strlen(i8* %arraydecay10), !dbg !114
  %conv12 = trunc i64 %call11 to i32, !dbg !114
  store i32 %conv12, i32* %bitsRead, align 4, !dbg !112
  %5 = load i32, i32* %retval, align 4, !dbg !115
  ret i32 %5, !dbg !115
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local i32 @svf_assert(...) #2

; Function Attrs: noreturn
declare dso_local void @exit(i32) #3

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

declare dso_local i32 @puts(i8*) #2

declare dso_local i64 @strlen(i8*) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/ikos_cases/fileread2.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 3, type: !13, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "src/ikos_cases/fileread2.c", directory: "/home/SVF-tools/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15, !16}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "argc", arg: 1, scope: !11, file: !12, line: 3, type: !15)
!20 = !DILocation(line: 3, column: 14, scope: !11)
!21 = !DILocalVariable(name: "argv", arg: 2, scope: !11, file: !12, line: 3, type: !16)
!22 = !DILocation(line: 3, column: 27, scope: !11)
!23 = !DILocalVariable(name: "fptr", scope: !11, file: !12, line: 4, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !26, line: 7, baseType: !27)
!26 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !28, line: 49, size: 1728, elements: !29)
!28 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!29 = !{!30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !45, !47, !48, !49, !53, !55, !57, !61, !64, !66, !69, !72, !73, !74, !78, !79}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !27, file: !28, line: 51, baseType: !15, size: 32)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !27, file: !28, line: 54, baseType: !17, size: 64, offset: 64)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !27, file: !28, line: 55, baseType: !17, size: 64, offset: 128)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !27, file: !28, line: 56, baseType: !17, size: 64, offset: 192)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !27, file: !28, line: 57, baseType: !17, size: 64, offset: 256)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !27, file: !28, line: 58, baseType: !17, size: 64, offset: 320)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !27, file: !28, line: 59, baseType: !17, size: 64, offset: 384)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !27, file: !28, line: 60, baseType: !17, size: 64, offset: 448)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !27, file: !28, line: 61, baseType: !17, size: 64, offset: 512)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !27, file: !28, line: 64, baseType: !17, size: 64, offset: 576)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !27, file: !28, line: 65, baseType: !17, size: 64, offset: 640)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !27, file: !28, line: 66, baseType: !17, size: 64, offset: 704)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !27, file: !28, line: 68, baseType: !43, size: 64, offset: 768)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !28, line: 36, flags: DIFlagFwdDecl)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !27, file: !28, line: 70, baseType: !46, size: 64, offset: 832)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !27, file: !28, line: 72, baseType: !15, size: 32, offset: 896)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !27, file: !28, line: 73, baseType: !15, size: 32, offset: 928)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !27, file: !28, line: 74, baseType: !50, size: 64, offset: 960)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !51, line: 152, baseType: !52)
!51 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!52 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !27, file: !28, line: 77, baseType: !54, size: 16, offset: 1024)
!54 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !27, file: !28, line: 78, baseType: !56, size: 8, offset: 1040)
!56 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !27, file: !28, line: 79, baseType: !58, size: 8, offset: 1048)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 8, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 1)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !27, file: !28, line: 81, baseType: !62, size: 64, offset: 1088)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !28, line: 43, baseType: null)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !27, file: !28, line: 89, baseType: !65, size: 64, offset: 1152)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !51, line: 153, baseType: !52)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !27, file: !28, line: 91, baseType: !67, size: 64, offset: 1216)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !28, line: 37, flags: DIFlagFwdDecl)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !27, file: !28, line: 92, baseType: !70, size: 64, offset: 1280)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !28, line: 38, flags: DIFlagFwdDecl)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !27, file: !28, line: 93, baseType: !46, size: 64, offset: 1344)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !27, file: !28, line: 94, baseType: !4, size: 64, offset: 1408)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !27, file: !28, line: 95, baseType: !75, size: 64, offset: 1472)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !76, line: 46, baseType: !77)
!76 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/SVF-tools")
!77 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !27, file: !28, line: 96, baseType: !15, size: 32, offset: 1536)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !27, file: !28, line: 98, baseType: !80, size: 160, offset: 1568)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 160, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 20)
!83 = !DILocation(line: 4, column: 11, scope: !11)
!84 = !DILocation(line: 5, column: 18, scope: !11)
!85 = !DILocation(line: 5, column: 12, scope: !11)
!86 = !DILocation(line: 5, column: 10, scope: !11)
!87 = !DILocalVariable(name: "str", scope: !11, file: !12, line: 6, type: !88)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 480, elements: !89)
!89 = !{!90}
!90 = !DISubrange(count: 60)
!91 = !DILocation(line: 6, column: 10, scope: !11)
!92 = !DILocation(line: 7, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !11, file: !12, line: 7, column: 8)
!94 = !DILocation(line: 7, column: 13, scope: !93)
!95 = !DILocation(line: 7, column: 8, scope: !11)
!96 = !DILocation(line: 9, column: 20, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !12, line: 8, column: 5)
!98 = !DILocation(line: 9, column: 24, scope: !97)
!99 = !DILocation(line: 9, column: 9, scope: !97)
!100 = !DILocation(line: 10, column: 9, scope: !97)
!101 = !DILocation(line: 12, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !11, file: !12, line: 12, column: 9)
!103 = !DILocation(line: 12, column: 25, scope: !102)
!104 = !DILocation(line: 12, column: 9, scope: !102)
!105 = !DILocation(line: 12, column: 30, scope: !102)
!106 = !DILocation(line: 12, column: 9, scope: !11)
!107 = !DILocation(line: 14, column: 14, scope: !108)
!108 = distinct !DILexicalBlock(scope: !102, file: !12, line: 12, column: 39)
!109 = !DILocation(line: 14, column: 9, scope: !108)
!110 = !DILocation(line: 15, column: 5, scope: !108)
!111 = !DILocalVariable(name: "bitsRead", scope: !11, file: !12, line: 16, type: !15)
!112 = !DILocation(line: 16, column: 9, scope: !11)
!113 = !DILocation(line: 16, column: 27, scope: !11)
!114 = !DILocation(line: 16, column: 20, scope: !11)
!115 = !DILocation(line: 19, column: 1, scope: !11)
