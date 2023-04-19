; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/safe/InFunc_ScanfsPackaged_DestOverflow_BadCase01.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/safe/InFunc_ScanfsPackaged_DestOverflow_BadCase01.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%3c\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"%[a-z]\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @SRC_sscanf_s(i8* noundef %buf, i8* noundef %format, ...) #0 !dbg !9 {
entry:
  %buf.addr = alloca i8*, align 8
  %format.addr = alloca i8*, align 8
  %ret = alloca i32, align 4
  %arglist = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !17, metadata !DIExpression()), !dbg !18
  store i8* %format, i8** %format.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %format.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %ret, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %arglist, metadata !23, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !39
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !39
  call void @llvm.va_start(i8* %arraydecay1), !dbg !39
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !40
  %1 = load i8*, i8** %format.addr, align 8, !dbg !41
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !42
  %call = call i32 (i8*, i8*, %struct.__va_list_tag*, ...) bitcast (i32 (...)* @vsscanf_s to i32 (i8*, i8*, %struct.__va_list_tag*, ...)*)(i8* noundef %0, i8* noundef %1, %struct.__va_list_tag* noundef %arraydecay2), !dbg !43
  store i32 %call, i32* %ret, align 4, !dbg !44
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !45
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*, !dbg !45
  call void @llvm.va_end(i8* %arraydecay34), !dbg !45
  %2 = load i32, i32* %ret, align 4, !dbg !46
  ret i32 %2, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #2

declare i32 @vsscanf_s(...) #3

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_197(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !48 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i64* %len, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !64
  %call = call i64 @strlen(i8* noundef %0), !dbg !65
  store i64 %call, i64* %len, align 8, !dbg !63
  %1 = load i8*, i8** %msg.addr, align 8, !dbg !66
  %2 = load i8*, i8** %buf.addr, align 8, !dbg !67
  %3 = load i64, i64* %len, align 8, !dbg !68
  %call1 = call i32 (i8*, i8*, ...) @SRC_sscanf_s(i8* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %2, i64 noundef %3), !dbg !69
  %4 = load i8*, i8** %msg.addr, align 8, !dbg !70
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !71
  %6 = load i64, i64* %len, align 8, !dbg !72
  %call2 = call i32 (i8*, i8*, ...) @SRC_sscanf_s(i8* noundef %4, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* noundef %5, i64 noundef %6), !dbg !73
  %7 = load i8*, i8** %msg.addr, align 8, !dbg !74
  %8 = load i8*, i8** %buf.addr, align 8, !dbg !75
  %9 = load i64, i64* %len, align 8, !dbg !76
  %call3 = call i32 (i8*, i8*, ...) @SRC_sscanf_s(i8* noundef %7, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i8* noundef %8, i64 noundef %9), !dbg !77
  ret void, !dbg !78
}

declare i64 @strlen(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %buf = alloca [16 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [16 x i8]* %buf, metadata !87, metadata !DIExpression()), !dbg !91
  %0 = load i32, i32* %argc.addr, align 4, !dbg !92
  %cmp = icmp sgt i32 %0, 1, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !96
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !98
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !98
  call void @cwe120_c_197(i8* noundef %arraydecay, i64 noundef 16, i8* noundef %2), !dbg !99
  br label %if.end, !dbg !100

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !101
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nofree nosync nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/safe/InFunc_ScanfsPackaged_DestOverflow_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "SRC_sscanf_s", scope: !10, file: !10, line: 10, type: !11, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!10 = !DIFile(filename: "safe/InFunc_ScanfsPackaged_DestOverflow_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !14, !14, null}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !{}
!17 = !DILocalVariable(name: "buf", arg: 1, scope: !9, file: !10, line: 10, type: !14)
!18 = !DILocation(line: 10, column: 24, scope: !9)
!19 = !DILocalVariable(name: "format", arg: 2, scope: !9, file: !10, line: 10, type: !14)
!20 = !DILocation(line: 10, column: 35, scope: !9)
!21 = !DILocalVariable(name: "ret", scope: !9, file: !10, line: 12, type: !13)
!22 = !DILocation(line: 12, column: 9, scope: !9)
!23 = !DILocalVariable(name: "arglist", scope: !9, file: !10, line: 13, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !25, line: 14, baseType: !26)
!25 = !DIFile(filename: "/usr/local/Cellar/llvm/14.0.6/lib/clang/14.0.6/include/stdarg.h", directory: "")
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !10, baseType: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 192, elements: !36)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !29)
!29 = !{!30, !32, !33, !35}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !28, file: !10, line: 13, baseType: !31, size: 32)
!31 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !28, file: !10, line: 13, baseType: !31, size: 32, offset: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !28, file: !10, line: 13, baseType: !34, size: 64, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !28, file: !10, line: 13, baseType: !34, size: 64, offset: 128)
!36 = !{!37}
!37 = !DISubrange(count: 1)
!38 = !DILocation(line: 13, column: 13, scope: !9)
!39 = !DILocation(line: 14, column: 5, scope: !9)
!40 = !DILocation(line: 15, column: 21, scope: !9)
!41 = !DILocation(line: 15, column: 26, scope: !9)
!42 = !DILocation(line: 15, column: 34, scope: !9)
!43 = !DILocation(line: 15, column: 11, scope: !9)
!44 = !DILocation(line: 15, column: 9, scope: !9)
!45 = !DILocation(line: 16, column: 5, scope: !9)
!46 = !DILocation(line: 17, column: 12, scope: !9)
!47 = !DILocation(line: 17, column: 5, scope: !9)
!48 = distinct !DISubprogram(name: "cwe120_c_197", scope: !10, file: !10, line: 23, type: !49, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!49 = !DISubroutineType(types: !50)
!50 = !{null, !14, !51, !14}
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 31, baseType: !53)
!52 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !54, line: 94, baseType: !55)
!54 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!55 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocalVariable(name: "buf", arg: 1, scope: !48, file: !10, line: 23, type: !14)
!57 = !DILocation(line: 23, column: 25, scope: !48)
!58 = !DILocalVariable(name: "bufSize", arg: 2, scope: !48, file: !10, line: 23, type: !51)
!59 = !DILocation(line: 23, column: 37, scope: !48)
!60 = !DILocalVariable(name: "msg", arg: 3, scope: !48, file: !10, line: 23, type: !14)
!61 = !DILocation(line: 23, column: 52, scope: !48)
!62 = !DILocalVariable(name: "len", scope: !48, file: !10, line: 25, type: !51)
!63 = !DILocation(line: 25, column: 12, scope: !48)
!64 = !DILocation(line: 25, column: 25, scope: !48)
!65 = !DILocation(line: 25, column: 18, scope: !48)
!66 = !DILocation(line: 27, column: 18, scope: !48)
!67 = !DILocation(line: 27, column: 29, scope: !48)
!68 = !DILocation(line: 27, column: 34, scope: !48)
!69 = !DILocation(line: 27, column: 5, scope: !48)
!70 = !DILocation(line: 29, column: 18, scope: !48)
!71 = !DILocation(line: 29, column: 30, scope: !48)
!72 = !DILocation(line: 29, column: 35, scope: !48)
!73 = !DILocation(line: 29, column: 5, scope: !48)
!74 = !DILocation(line: 31, column: 18, scope: !48)
!75 = !DILocation(line: 31, column: 33, scope: !48)
!76 = !DILocation(line: 31, column: 38, scope: !48)
!77 = !DILocation(line: 31, column: 5, scope: !48)
!78 = !DILocation(line: 32, column: 1, scope: !48)
!79 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 33, type: !80, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!80 = !DISubroutineType(types: !81)
!81 = !{!13, !13, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !10, line: 33, type: !13)
!84 = !DILocation(line: 33, column: 14, scope: !79)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !10, line: 33, type: !82)
!86 = !DILocation(line: 33, column: 27, scope: !79)
!87 = !DILocalVariable(name: "buf", scope: !79, file: !10, line: 35, type: !88)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, elements: !89)
!89 = !{!90}
!90 = !DISubrange(count: 16)
!91 = !DILocation(line: 35, column: 10, scope: !79)
!92 = !DILocation(line: 36, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !79, file: !10, line: 36, column: 9)
!94 = !DILocation(line: 36, column: 14, scope: !93)
!95 = !DILocation(line: 36, column: 9, scope: !79)
!96 = !DILocation(line: 37, column: 22, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !10, line: 36, column: 19)
!98 = !DILocation(line: 37, column: 40, scope: !97)
!99 = !DILocation(line: 37, column: 9, scope: !97)
!100 = !DILocation(line: 38, column: 5, scope: !97)
!101 = !DILocation(line: 39, column: 5, scope: !79)
