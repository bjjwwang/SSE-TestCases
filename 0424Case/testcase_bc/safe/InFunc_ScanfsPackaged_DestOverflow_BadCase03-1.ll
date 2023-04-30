; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/safe/InFunc_ScanfsPackaged_DestOverflow_BadCase03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/safe/InFunc_ScanfsPackaged_DestOverflow_BadCase03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%3c\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"%[a-z]\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @SRC_fscanf_s(%struct.__sFILE* noundef %stream, i8* noundef %format, ...) #0 !dbg !9 {
entry:
  %stream.addr = alloca %struct.__sFILE*, align 8
  %format.addr = alloca i8*, align 8
  %ret = alloca i32, align 4
  %arglist = alloca [1 x %struct.__va_list_tag], align 16
  store %struct.__sFILE* %stream, %struct.__sFILE** %stream.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.__sFILE** %stream.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8* %format, i8** %format.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %format.addr, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !82, metadata !DIExpression()), !dbg !83
  store i32 0, i32* %ret, align 4, !dbg !83
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %arglist, metadata !84, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !97
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !97
  call void @llvm.va_start(i8* %arraydecay1), !dbg !97
  %0 = load %struct.__sFILE*, %struct.__sFILE** %stream.addr, align 8, !dbg !98
  %1 = load i8*, i8** %format.addr, align 8, !dbg !99
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !100
  %call = call i32 (%struct.__sFILE*, i8*, %struct.__va_list_tag*, ...) bitcast (i32 (...)* @vfscanf_s to i32 (%struct.__sFILE*, i8*, %struct.__va_list_tag*, ...)*)(%struct.__sFILE* noundef %0, i8* noundef %1, %struct.__va_list_tag* noundef %arraydecay2), !dbg !101
  store i32 %call, i32* %ret, align 4, !dbg !102
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !103
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*, !dbg !103
  call void @llvm.va_end(i8* %arraydecay34), !dbg !103
  %2 = load i32, i32* %ret, align 4, !dbg !104
  ret i32 %2, !dbg !105
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #2

declare i32 @vfscanf_s(...) #3

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_199(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !106 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !113, metadata !DIExpression()), !dbg !114
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %len, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !121
  %call = call i64 @strlen(i8* noundef %0), !dbg !122
  store i64 %call, i64* %len, align 8, !dbg !120
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !123
  %2 = load i8*, i8** %buf.addr, align 8, !dbg !124
  %3 = load i64, i64* %len, align 8, !dbg !125
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @SRC_fscanf_s(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %2, i64 noundef %3), !dbg !126
  %4 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !127
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !128
  %6 = load i64, i64* %len, align 8, !dbg !129
  %call2 = call i32 (%struct.__sFILE*, i8*, ...) @SRC_fscanf_s(%struct.__sFILE* noundef %4, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* noundef %5, i64 noundef %6), !dbg !130
  %7 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !131
  %8 = load i8*, i8** %buf.addr, align 8, !dbg !132
  %9 = load i64, i64* %len, align 8, !dbg !133
  %call3 = call i32 (%struct.__sFILE*, i8*, ...) @SRC_fscanf_s(%struct.__sFILE* noundef %7, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i8* noundef %8, i64 noundef %9), !dbg !134
  ret void, !dbg !135
}

declare i64 @strlen(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !136 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %buf = alloca [16 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !140, metadata !DIExpression()), !dbg !141
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [16 x i8]* %buf, metadata !144, metadata !DIExpression()), !dbg !148
  %0 = load i32, i32* %argc.addr, align 4, !dbg !149
  %cmp = icmp sgt i32 %0, 1, !dbg !151
  br i1 %cmp, label %if.then, label %if.end, !dbg !152

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !153
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !155
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !155
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !155
  call void @cwe120_c_199(i8* noundef %arraydecay, i64 noundef 16, i8* noundef %2), !dbg !156
  br label %if.end, !dbg !157

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !158
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nofree nosync nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/safe/InFunc_ScanfsPackaged_DestOverflow_BadCase03-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "SRC_fscanf_s", scope: !10, file: !10, line: 11, type: !11, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!10 = !DIFile(filename: "safe/InFunc_ScanfsPackaged_DestOverflow_BadCase03-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !14, !59, null}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !16, line: 157, baseType: !17)
!16 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/_stdio.h", directory: "")
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !16, line: 126, size: 1216, elements: !18)
!18 = !{!19, !22, !23, !24, !26, !27, !32, !33, !35, !39, !45, !55, !61, !62, !65, !66, !70, !74, !75, !76}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !17, file: !16, line: 127, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !17, file: !16, line: 128, baseType: !13, size: 32, offset: 64)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !17, file: !16, line: 129, baseType: !13, size: 32, offset: 96)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !17, file: !16, line: 130, baseType: !25, size: 16, offset: 128)
!25 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !17, file: !16, line: 131, baseType: !25, size: 16, offset: 144)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !17, file: !16, line: 132, baseType: !28, size: 128, offset: 192)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !16, line: 92, size: 128, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !28, file: !16, line: 93, baseType: !20, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !28, file: !16, line: 94, baseType: !13, size: 32, offset: 64)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !17, file: !16, line: 133, baseType: !13, size: 32, offset: 320)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !17, file: !16, line: 136, baseType: !34, size: 64, offset: 384)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !17, file: !16, line: 137, baseType: !36, size: 64, offset: 448)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DISubroutineType(types: !38)
!38 = !{!13, !34}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !17, file: !16, line: 138, baseType: !40, size: 64, offset: 512)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DISubroutineType(types: !42)
!42 = !{!13, !34, !43, !13}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !17, file: !16, line: 139, baseType: !46, size: 64, offset: 576)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !34, !49, !13}
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !16, line: 81, baseType: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !51, line: 71, baseType: !52)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types.h", directory: "")
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !53, line: 48, baseType: !54)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!54 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !17, file: !16, line: 140, baseType: !56, size: 64, offset: 640)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DISubroutineType(types: !58)
!58 = !{!13, !34, !59, !13}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !44)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !17, file: !16, line: 143, baseType: !28, size: 128, offset: 704)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !17, file: !16, line: 144, baseType: !63, size: 64, offset: 832)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !16, line: 98, flags: DIFlagFwdDecl)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !17, file: !16, line: 145, baseType: !13, size: 32, offset: 896)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !17, file: !16, line: 148, baseType: !67, size: 24, offset: 928)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 24, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 3)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !17, file: !16, line: 149, baseType: !71, size: 8, offset: 952)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 8, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 1)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !17, file: !16, line: 152, baseType: !28, size: 128, offset: 960)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !17, file: !16, line: 155, baseType: !13, size: 32, offset: 1088)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !17, file: !16, line: 156, baseType: !49, size: 64, offset: 1152)
!77 = !{}
!78 = !DILocalVariable(name: "stream", arg: 1, scope: !9, file: !10, line: 11, type: !14)
!79 = !DILocation(line: 11, column: 24, scope: !9)
!80 = !DILocalVariable(name: "format", arg: 2, scope: !9, file: !10, line: 11, type: !59)
!81 = !DILocation(line: 11, column: 44, scope: !9)
!82 = !DILocalVariable(name: "ret", scope: !9, file: !10, line: 13, type: !13)
!83 = !DILocation(line: 13, column: 9, scope: !9)
!84 = !DILocalVariable(name: "arglist", scope: !9, file: !10, line: 14, type: !85)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !86, line: 14, baseType: !87)
!86 = !DIFile(filename: "/usr/local/Cellar/llvm/14.0.6/lib/clang/14.0.6/include/stdarg.h", directory: "")
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !10, baseType: !88)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !89, size: 192, elements: !72)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !90)
!90 = !{!91, !93, !94, !95}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !89, file: !10, line: 14, baseType: !92, size: 32)
!92 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !89, file: !10, line: 14, baseType: !92, size: 32, offset: 32)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !89, file: !10, line: 14, baseType: !34, size: 64, offset: 64)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !89, file: !10, line: 14, baseType: !34, size: 64, offset: 128)
!96 = !DILocation(line: 14, column: 13, scope: !9)
!97 = !DILocation(line: 15, column: 5, scope: !9)
!98 = !DILocation(line: 16, column: 21, scope: !9)
!99 = !DILocation(line: 16, column: 29, scope: !9)
!100 = !DILocation(line: 16, column: 37, scope: !9)
!101 = !DILocation(line: 16, column: 11, scope: !9)
!102 = !DILocation(line: 16, column: 9, scope: !9)
!103 = !DILocation(line: 17, column: 5, scope: !9)
!104 = !DILocation(line: 18, column: 12, scope: !9)
!105 = !DILocation(line: 18, column: 5, scope: !9)
!106 = distinct !DISubprogram(name: "cwe120_c_199", scope: !10, file: !10, line: 24, type: !107, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!107 = !DISubroutineType(types: !108)
!108 = !{null, !43, !109, !43}
!109 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !110, line: 31, baseType: !111)
!110 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !53, line: 94, baseType: !112)
!112 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!113 = !DILocalVariable(name: "buf", arg: 1, scope: !106, file: !10, line: 24, type: !43)
!114 = !DILocation(line: 24, column: 25, scope: !106)
!115 = !DILocalVariable(name: "bufSize", arg: 2, scope: !106, file: !10, line: 24, type: !109)
!116 = !DILocation(line: 24, column: 37, scope: !106)
!117 = !DILocalVariable(name: "msg", arg: 3, scope: !106, file: !10, line: 24, type: !43)
!118 = !DILocation(line: 24, column: 52, scope: !106)
!119 = !DILocalVariable(name: "len", scope: !106, file: !10, line: 26, type: !109)
!120 = !DILocation(line: 26, column: 12, scope: !106)
!121 = !DILocation(line: 26, column: 25, scope: !106)
!122 = !DILocation(line: 26, column: 18, scope: !106)
!123 = !DILocation(line: 28, column: 18, scope: !106)
!124 = !DILocation(line: 28, column: 31, scope: !106)
!125 = !DILocation(line: 28, column: 36, scope: !106)
!126 = !DILocation(line: 28, column: 5, scope: !106)
!127 = !DILocation(line: 30, column: 18, scope: !106)
!128 = !DILocation(line: 30, column: 32, scope: !106)
!129 = !DILocation(line: 30, column: 37, scope: !106)
!130 = !DILocation(line: 30, column: 5, scope: !106)
!131 = !DILocation(line: 32, column: 18, scope: !106)
!132 = !DILocation(line: 32, column: 35, scope: !106)
!133 = !DILocation(line: 32, column: 40, scope: !106)
!134 = !DILocation(line: 32, column: 5, scope: !106)
!135 = !DILocation(line: 33, column: 1, scope: !106)
!136 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 34, type: !137, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!137 = !DISubroutineType(types: !138)
!138 = !{!13, !13, !139}
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!140 = !DILocalVariable(name: "argc", arg: 1, scope: !136, file: !10, line: 34, type: !13)
!141 = !DILocation(line: 34, column: 14, scope: !136)
!142 = !DILocalVariable(name: "argv", arg: 2, scope: !136, file: !10, line: 34, type: !139)
!143 = !DILocation(line: 34, column: 27, scope: !136)
!144 = !DILocalVariable(name: "buf", scope: !136, file: !10, line: 36, type: !145)
!145 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 128, elements: !146)
!146 = !{!147}
!147 = !DISubrange(count: 16)
!148 = !DILocation(line: 36, column: 10, scope: !136)
!149 = !DILocation(line: 37, column: 9, scope: !150)
!150 = distinct !DILexicalBlock(scope: !136, file: !10, line: 37, column: 9)
!151 = !DILocation(line: 37, column: 14, scope: !150)
!152 = !DILocation(line: 37, column: 9, scope: !136)
!153 = !DILocation(line: 38, column: 22, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !10, line: 37, column: 19)
!155 = !DILocation(line: 38, column: 40, scope: !154)
!156 = !DILocation(line: 38, column: 9, scope: !154)
!157 = !DILocation(line: 39, column: 5, scope: !154)
!158 = !DILocation(line: 40, column: 5, scope: !136)
