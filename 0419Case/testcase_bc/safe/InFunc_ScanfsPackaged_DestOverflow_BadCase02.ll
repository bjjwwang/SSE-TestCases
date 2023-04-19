; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/safe/InFunc_ScanfsPackaged_DestOverflow_BadCase02.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/safe/InFunc_ScanfsPackaged_DestOverflow_BadCase02.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%3c\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"%[a-z]\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @SRC_scanf_s(i8* noundef %format, ...) #0 !dbg !9 {
entry:
  %format.addr = alloca i8*, align 8
  %ret = alloca i32, align 4
  %arglist = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %format, i8** %format.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %format.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %ret, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %arglist, metadata !21, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !37
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !37
  call void @llvm.va_start(i8* %arraydecay1), !dbg !37
  %0 = load i8*, i8** %format.addr, align 8, !dbg !38
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !39
  %call = call i32 (i8*, %struct.__va_list_tag*, ...) bitcast (i32 (...)* @vscanf_s to i32 (i8*, %struct.__va_list_tag*, ...)*)(i8* noundef %0, %struct.__va_list_tag* noundef %arraydecay2), !dbg !40
  store i32 %call, i32* %ret, align 4, !dbg !41
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !42
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*, !dbg !42
  call void @llvm.va_end(i8* %arraydecay34), !dbg !42
  %1 = load i32, i32* %ret, align 4, !dbg !43
  ret i32 %1, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #2

declare i32 @vscanf_s(...) #3

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_198(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !45 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %len, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !61
  %call = call i64 @strlen(i8* noundef %0), !dbg !62
  store i64 %call, i64* %len, align 8, !dbg !60
  %1 = load i8*, i8** %buf.addr, align 8, !dbg !63
  %2 = load i64, i64* %len, align 8, !dbg !64
  %call1 = call i32 (i8*, ...) @SRC_scanf_s(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %1, i64 noundef %2), !dbg !65
  %3 = load i8*, i8** %buf.addr, align 8, !dbg !66
  %4 = load i64, i64* %len, align 8, !dbg !67
  %call2 = call i32 (i8*, ...) @SRC_scanf_s(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* noundef %3, i64 noundef %4), !dbg !68
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !69
  %6 = load i64, i64* %len, align 8, !dbg !70
  %call3 = call i32 (i8*, ...) @SRC_scanf_s(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i8* noundef %5, i64 noundef %6), !dbg !71
  ret void, !dbg !72
}

declare i64 @strlen(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %buf = alloca [16 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [16 x i8]* %buf, metadata !81, metadata !DIExpression()), !dbg !85
  %0 = load i32, i32* %argc.addr, align 4, !dbg !86
  %cmp = icmp sgt i32 %0, 1, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !90
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !92
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !92
  call void @cwe120_c_198(i8* noundef %arraydecay, i64 noundef 16, i8* noundef %2), !dbg !93
  br label %if.end, !dbg !94

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !95
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nofree nosync nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/safe/InFunc_ScanfsPackaged_DestOverflow_BadCase02.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "SRC_scanf_s", scope: !10, file: !10, line: 10, type: !11, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!10 = !DIFile(filename: "safe/InFunc_ScanfsPackaged_DestOverflow_BadCase02.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !14, null}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !{}
!17 = !DILocalVariable(name: "format", arg: 1, scope: !9, file: !10, line: 10, type: !14)
!18 = !DILocation(line: 10, column: 23, scope: !9)
!19 = !DILocalVariable(name: "ret", scope: !9, file: !10, line: 12, type: !13)
!20 = !DILocation(line: 12, column: 9, scope: !9)
!21 = !DILocalVariable(name: "arglist", scope: !9, file: !10, line: 13, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !23, line: 14, baseType: !24)
!23 = !DIFile(filename: "/usr/local/Cellar/llvm/14.0.6/lib/clang/14.0.6/include/stdarg.h", directory: "")
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !10, baseType: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 192, elements: !34)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !27)
!27 = !{!28, !30, !31, !33}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !26, file: !10, line: 13, baseType: !29, size: 32)
!29 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !26, file: !10, line: 13, baseType: !29, size: 32, offset: 32)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !26, file: !10, line: 13, baseType: !32, size: 64, offset: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !26, file: !10, line: 13, baseType: !32, size: 64, offset: 128)
!34 = !{!35}
!35 = !DISubrange(count: 1)
!36 = !DILocation(line: 13, column: 13, scope: !9)
!37 = !DILocation(line: 14, column: 5, scope: !9)
!38 = !DILocation(line: 15, column: 20, scope: !9)
!39 = !DILocation(line: 15, column: 28, scope: !9)
!40 = !DILocation(line: 15, column: 11, scope: !9)
!41 = !DILocation(line: 15, column: 9, scope: !9)
!42 = !DILocation(line: 16, column: 5, scope: !9)
!43 = !DILocation(line: 17, column: 12, scope: !9)
!44 = !DILocation(line: 17, column: 5, scope: !9)
!45 = distinct !DISubprogram(name: "cwe120_c_198", scope: !10, file: !10, line: 23, type: !46, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!46 = !DISubroutineType(types: !47)
!47 = !{null, !14, !48, !14}
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 31, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !51, line: 94, baseType: !52)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!52 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocalVariable(name: "buf", arg: 1, scope: !45, file: !10, line: 23, type: !14)
!54 = !DILocation(line: 23, column: 25, scope: !45)
!55 = !DILocalVariable(name: "bufSize", arg: 2, scope: !45, file: !10, line: 23, type: !48)
!56 = !DILocation(line: 23, column: 37, scope: !45)
!57 = !DILocalVariable(name: "msg", arg: 3, scope: !45, file: !10, line: 23, type: !14)
!58 = !DILocation(line: 23, column: 52, scope: !45)
!59 = !DILocalVariable(name: "len", scope: !45, file: !10, line: 25, type: !48)
!60 = !DILocation(line: 25, column: 12, scope: !45)
!61 = !DILocation(line: 25, column: 25, scope: !45)
!62 = !DILocation(line: 25, column: 18, scope: !45)
!63 = !DILocation(line: 27, column: 23, scope: !45)
!64 = !DILocation(line: 27, column: 28, scope: !45)
!65 = !DILocation(line: 27, column: 5, scope: !45)
!66 = !DILocation(line: 29, column: 24, scope: !45)
!67 = !DILocation(line: 29, column: 29, scope: !45)
!68 = !DILocation(line: 29, column: 5, scope: !45)
!69 = !DILocation(line: 31, column: 27, scope: !45)
!70 = !DILocation(line: 31, column: 32, scope: !45)
!71 = !DILocation(line: 31, column: 5, scope: !45)
!72 = !DILocation(line: 32, column: 1, scope: !45)
!73 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 33, type: !74, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!74 = !DISubroutineType(types: !75)
!75 = !{!13, !13, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !10, line: 33, type: !13)
!78 = !DILocation(line: 33, column: 14, scope: !73)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !10, line: 33, type: !76)
!80 = !DILocation(line: 33, column: 27, scope: !73)
!81 = !DILocalVariable(name: "buf", scope: !73, file: !10, line: 35, type: !82)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, elements: !83)
!83 = !{!84}
!84 = !DISubrange(count: 16)
!85 = !DILocation(line: 35, column: 10, scope: !73)
!86 = !DILocation(line: 36, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !73, file: !10, line: 36, column: 9)
!88 = !DILocation(line: 36, column: 14, scope: !87)
!89 = !DILocation(line: 36, column: 9, scope: !73)
!90 = !DILocation(line: 37, column: 22, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !10, line: 36, column: 19)
!92 = !DILocation(line: 37, column: 40, scope: !91)
!93 = !DILocation(line: 37, column: 9, scope: !91)
!94 = !DILocation(line: 38, column: 5, scope: !91)
!95 = !DILocation(line: 39, column: 5, scope: !73)
