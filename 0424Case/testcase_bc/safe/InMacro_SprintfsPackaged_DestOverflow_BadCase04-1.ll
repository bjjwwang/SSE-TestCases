; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/safe/InMacro_SprintfsPackaged_DestOverflow_BadCase04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/safe/InMacro_SprintfsPackaged_DestOverflow_BadCase04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @callvsprintf_s2(i8* noundef %buf, i64 noundef %destMax, i8* noundef %format, ...) #0 !dbg !9 {
entry:
  %buf.addr = alloca i8*, align 8
  %destMax.addr = alloca i64, align 8
  %format.addr = alloca i8*, align 8
  %ret = alloca i32, align 4
  %arglist = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !22, metadata !DIExpression()), !dbg !23
  store i64 %destMax, i64* %destMax.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %destMax.addr, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* %format, i8** %format.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %format.addr, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 0, i32* %ret, align 4, !dbg !29
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %arglist, metadata !30, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !46
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !46
  call void @llvm.va_start(i8* %arraydecay1), !dbg !46
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !47
  %1 = load i64, i64* %destMax.addr, align 8, !dbg !48
  %2 = load i8*, i8** %format.addr, align 8, !dbg !49
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !50
  %call = call i32 @VOS_vsprintf_s(i8* noundef %0, i64 noundef %1, i8* noundef %2, %struct.__va_list_tag* noundef %arraydecay2), !dbg !51
  store i32 %call, i32* %ret, align 4, !dbg !52
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !53
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*, !dbg !53
  call void @llvm.va_end(i8* %arraydecay34), !dbg !53
  %3 = load i32, i32* %ret, align 4, !dbg !54
  ret i32 %3, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #2

declare i32 @VOS_vsprintf_s(i8* noundef, i64 noundef, i8* noundef, %struct.__va_list_tag* noundef) #3

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_222(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !56 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i64* %len, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !67
  %call = call i64 @strlen(i8* noundef %0), !dbg !68
  store i64 %call, i64* %len, align 8, !dbg !66
  %1 = load i8*, i8** %buf.addr, align 8, !dbg !69
  %2 = load i64, i64* %len, align 8, !dbg !70
  %3 = load i8*, i8** %msg.addr, align 8, !dbg !71
  %call1 = call i32 (i8*, i64, i8*, ...) @callvsprintf_s2(i8* noundef %1, i64 noundef %2, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %3), !dbg !72
  ret void, !dbg !73
}

declare i64 @strlen(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @callvsprintf_s1(i8* noundef %buf, i64 noundef %destMax, i8* noundef %format, ...) #0 !dbg !74 {
entry:
  %buf.addr = alloca i8*, align 8
  %destMax.addr = alloca i64, align 8
  %format.addr = alloca i8*, align 8
  %ret = alloca i32, align 4
  %arglist = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i64 %destMax, i64* %destMax.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %destMax.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8* %format, i8** %format.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %format.addr, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !81, metadata !DIExpression()), !dbg !82
  store i32 0, i32* %ret, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %arglist, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !85
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !85
  call void @llvm.va_start(i8* %arraydecay1), !dbg !85
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !86
  %1 = load i64, i64* %destMax.addr, align 8, !dbg !87
  %2 = load i8*, i8** %format.addr, align 8, !dbg !88
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !89
  %call = call i32 (i8*, i64, i8*, %struct.__va_list_tag*, ...) bitcast (i32 (...)* @vsprintf_s to i32 (i8*, i64, i8*, %struct.__va_list_tag*, ...)*)(i8* noundef %0, i64 noundef %1, i8* noundef %2, %struct.__va_list_tag* noundef %arraydecay2), !dbg !90
  store i32 %call, i32* %ret, align 4, !dbg !91
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !92
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*, !dbg !92
  call void @llvm.va_end(i8* %arraydecay34), !dbg !92
  %3 = load i32, i32* %ret, align 4, !dbg !93
  ret i32 %3, !dbg !94
}

declare i32 @vsprintf_s(...) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_212(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !95 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i64* %len, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !104
  %call = call i64 @strlen(i8* noundef %0), !dbg !105
  store i64 %call, i64* %len, align 8, !dbg !103
  %1 = load i8*, i8** %buf.addr, align 8, !dbg !106
  %2 = load i64, i64* %len, align 8, !dbg !107
  %3 = load i8*, i8** %msg.addr, align 8, !dbg !108
  %call1 = call i32 (i8*, i64, i8*, ...) @callvsprintf_s1(i8* noundef %1, i64 noundef %2, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %3), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @callvsprintf_s(i8* noundef %buf, i64 noundef %destMax, i8* noundef %format, ...) #0 !dbg !111 {
entry:
  %buf.addr = alloca i8*, align 8
  %destMax.addr = alloca i64, align 8
  %format.addr = alloca i8*, align 8
  %ret = alloca i32, align 4
  %arglist = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !112, metadata !DIExpression()), !dbg !113
  store i64 %destMax, i64* %destMax.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %destMax.addr, metadata !114, metadata !DIExpression()), !dbg !115
  store i8* %format, i8** %format.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %format.addr, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !118, metadata !DIExpression()), !dbg !119
  store i32 0, i32* %ret, align 4, !dbg !119
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %arglist, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !122
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*, !dbg !122
  call void @llvm.va_start(i8* %arraydecay1), !dbg !122
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !123
  %1 = load i64, i64* %destMax.addr, align 8, !dbg !124
  %2 = load i8*, i8** %format.addr, align 8, !dbg !125
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !126
  %call = call i32 (i8*, i64, i8*, %struct.__va_list_tag*, ...) bitcast (i32 (...)* @vsprintf_s to i32 (i8*, i64, i8*, %struct.__va_list_tag*, ...)*)(i8* noundef %0, i64 noundef %1, i8* noundef %2, %struct.__va_list_tag* noundef %arraydecay2), !dbg !127
  store i32 %call, i32* %ret, align 4, !dbg !128
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %arglist, i64 0, i64 0, !dbg !129
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*, !dbg !129
  call void @llvm.va_end(i8* %arraydecay34), !dbg !129
  %3 = load i32, i32* %ret, align 4, !dbg !130
  ret i32 %3, !dbg !131
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_216(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !132 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !133, metadata !DIExpression()), !dbg !134
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !135, metadata !DIExpression()), !dbg !136
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %len, metadata !139, metadata !DIExpression()), !dbg !140
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !141
  %call = call i64 @strlen(i8* noundef %0), !dbg !142
  store i64 %call, i64* %len, align 8, !dbg !140
  %1 = load i8*, i8** %buf.addr, align 8, !dbg !143
  %2 = load i64, i64* %len, align 8, !dbg !144
  %3 = load i8*, i8** %msg.addr, align 8, !dbg !145
  %call1 = call i32 (i8*, i64, i8*, ...) @callvsprintf_s(i8* noundef %1, i64 noundef %2, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %3), !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !148 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %buf = alloca [16 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !152, metadata !DIExpression()), !dbg !153
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [16 x i8]* %buf, metadata !156, metadata !DIExpression()), !dbg !160
  %0 = load i32, i32* %argc.addr, align 4, !dbg !161
  %cmp = icmp sgt i32 %0, 1, !dbg !163
  br i1 %cmp, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !165
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !167
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !167
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !167
  call void @cwe120_c_212(i8* noundef %arraydecay, i64 noundef 16, i8* noundef %2), !dbg !168
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !169
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !170
  %arrayidx2 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !170
  %4 = load i8*, i8** %arrayidx2, align 8, !dbg !170
  call void @cwe120_c_216(i8* noundef %arraydecay1, i64 noundef 16, i8* noundef %4), !dbg !171
  %arraydecay3 = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !172
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !173
  %arrayidx4 = getelementptr inbounds i8*, i8** %5, i64 1, !dbg !173
  %6 = load i8*, i8** %arrayidx4, align 8, !dbg !173
  call void @cwe120_c_222(i8* noundef %arraydecay3, i64 noundef 16, i8* noundef %6), !dbg !174
  br label %if.end, !dbg !175

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !176
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nofree nosync nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/safe/InMacro_SprintfsPackaged_DestOverflow_BadCase04-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "callvsprintf_s2", scope: !10, file: !10, line: 11, type: !11, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!10 = !DIFile(filename: "safe/InMacro_SprintfsPackaged_DestOverflow_BadCase04-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !14, !16, !14, null}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !17, line: 31, baseType: !18)
!17 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !19, line: 94, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!20 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!21 = !{}
!22 = !DILocalVariable(name: "buf", arg: 1, scope: !9, file: !10, line: 11, type: !14)
!23 = !DILocation(line: 11, column: 27, scope: !9)
!24 = !DILocalVariable(name: "destMax", arg: 2, scope: !9, file: !10, line: 11, type: !16)
!25 = !DILocation(line: 11, column: 39, scope: !9)
!26 = !DILocalVariable(name: "format", arg: 3, scope: !9, file: !10, line: 11, type: !14)
!27 = !DILocation(line: 11, column: 54, scope: !9)
!28 = !DILocalVariable(name: "ret", scope: !9, file: !10, line: 13, type: !13)
!29 = !DILocation(line: 13, column: 9, scope: !9)
!30 = !DILocalVariable(name: "arglist", scope: !9, file: !10, line: 14, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !32, line: 14, baseType: !33)
!32 = !DIFile(filename: "/usr/local/Cellar/llvm/14.0.6/lib/clang/14.0.6/include/stdarg.h", directory: "")
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !10, baseType: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 192, elements: !43)
!35 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !36)
!36 = !{!37, !39, !40, !42}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !35, file: !10, line: 14, baseType: !38, size: 32)
!38 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !35, file: !10, line: 14, baseType: !38, size: 32, offset: 32)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !35, file: !10, line: 14, baseType: !41, size: 64, offset: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !35, file: !10, line: 14, baseType: !41, size: 64, offset: 128)
!43 = !{!44}
!44 = !DISubrange(count: 1)
!45 = !DILocation(line: 14, column: 13, scope: !9)
!46 = !DILocation(line: 15, column: 5, scope: !9)
!47 = !DILocation(line: 16, column: 26, scope: !9)
!48 = !DILocation(line: 16, column: 31, scope: !9)
!49 = !DILocation(line: 16, column: 40, scope: !9)
!50 = !DILocation(line: 16, column: 48, scope: !9)
!51 = !DILocation(line: 16, column: 11, scope: !9)
!52 = !DILocation(line: 16, column: 9, scope: !9)
!53 = !DILocation(line: 17, column: 5, scope: !9)
!54 = !DILocation(line: 18, column: 12, scope: !9)
!55 = !DILocation(line: 18, column: 5, scope: !9)
!56 = distinct !DISubprogram(name: "cwe120_c_222", scope: !10, file: !10, line: 24, type: !57, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!57 = !DISubroutineType(types: !58)
!58 = !{null, !14, !16, !14}
!59 = !DILocalVariable(name: "buf", arg: 1, scope: !56, file: !10, line: 24, type: !14)
!60 = !DILocation(line: 24, column: 25, scope: !56)
!61 = !DILocalVariable(name: "bufSize", arg: 2, scope: !56, file: !10, line: 24, type: !16)
!62 = !DILocation(line: 24, column: 37, scope: !56)
!63 = !DILocalVariable(name: "msg", arg: 3, scope: !56, file: !10, line: 24, type: !14)
!64 = !DILocation(line: 24, column: 52, scope: !56)
!65 = !DILocalVariable(name: "len", scope: !56, file: !10, line: 26, type: !16)
!66 = !DILocation(line: 26, column: 12, scope: !56)
!67 = !DILocation(line: 26, column: 25, scope: !56)
!68 = !DILocation(line: 26, column: 18, scope: !56)
!69 = !DILocation(line: 28, column: 21, scope: !56)
!70 = !DILocation(line: 28, column: 26, scope: !56)
!71 = !DILocation(line: 28, column: 37, scope: !56)
!72 = !DILocation(line: 28, column: 5, scope: !56)
!73 = !DILocation(line: 29, column: 1, scope: !56)
!74 = distinct !DISubprogram(name: "callvsprintf_s1", scope: !10, file: !10, line: 31, type: !11, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!75 = !DILocalVariable(name: "buf", arg: 1, scope: !74, file: !10, line: 31, type: !14)
!76 = !DILocation(line: 31, column: 27, scope: !74)
!77 = !DILocalVariable(name: "destMax", arg: 2, scope: !74, file: !10, line: 31, type: !16)
!78 = !DILocation(line: 31, column: 39, scope: !74)
!79 = !DILocalVariable(name: "format", arg: 3, scope: !74, file: !10, line: 31, type: !14)
!80 = !DILocation(line: 31, column: 54, scope: !74)
!81 = !DILocalVariable(name: "ret", scope: !74, file: !10, line: 33, type: !13)
!82 = !DILocation(line: 33, column: 9, scope: !74)
!83 = !DILocalVariable(name: "arglist", scope: !74, file: !10, line: 34, type: !31)
!84 = !DILocation(line: 34, column: 13, scope: !74)
!85 = !DILocation(line: 35, column: 5, scope: !74)
!86 = !DILocation(line: 36, column: 22, scope: !74)
!87 = !DILocation(line: 36, column: 27, scope: !74)
!88 = !DILocation(line: 36, column: 36, scope: !74)
!89 = !DILocation(line: 36, column: 44, scope: !74)
!90 = !DILocation(line: 36, column: 11, scope: !74)
!91 = !DILocation(line: 36, column: 9, scope: !74)
!92 = !DILocation(line: 37, column: 5, scope: !74)
!93 = !DILocation(line: 38, column: 12, scope: !74)
!94 = !DILocation(line: 38, column: 5, scope: !74)
!95 = distinct !DISubprogram(name: "cwe120_c_212", scope: !10, file: !10, line: 45, type: !57, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!96 = !DILocalVariable(name: "buf", arg: 1, scope: !95, file: !10, line: 45, type: !14)
!97 = !DILocation(line: 45, column: 25, scope: !95)
!98 = !DILocalVariable(name: "bufSize", arg: 2, scope: !95, file: !10, line: 45, type: !16)
!99 = !DILocation(line: 45, column: 37, scope: !95)
!100 = !DILocalVariable(name: "msg", arg: 3, scope: !95, file: !10, line: 45, type: !14)
!101 = !DILocation(line: 45, column: 52, scope: !95)
!102 = !DILocalVariable(name: "len", scope: !95, file: !10, line: 47, type: !16)
!103 = !DILocation(line: 47, column: 12, scope: !95)
!104 = !DILocation(line: 47, column: 25, scope: !95)
!105 = !DILocation(line: 47, column: 18, scope: !95)
!106 = !DILocation(line: 49, column: 21, scope: !95)
!107 = !DILocation(line: 49, column: 26, scope: !95)
!108 = !DILocation(line: 49, column: 37, scope: !95)
!109 = !DILocation(line: 49, column: 5, scope: !95)
!110 = !DILocation(line: 50, column: 1, scope: !95)
!111 = distinct !DISubprogram(name: "callvsprintf_s", scope: !10, file: !10, line: 57, type: !11, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!112 = !DILocalVariable(name: "buf", arg: 1, scope: !111, file: !10, line: 57, type: !14)
!113 = !DILocation(line: 57, column: 26, scope: !111)
!114 = !DILocalVariable(name: "destMax", arg: 2, scope: !111, file: !10, line: 57, type: !16)
!115 = !DILocation(line: 57, column: 38, scope: !111)
!116 = !DILocalVariable(name: "format", arg: 3, scope: !111, file: !10, line: 57, type: !14)
!117 = !DILocation(line: 57, column: 53, scope: !111)
!118 = !DILocalVariable(name: "ret", scope: !111, file: !10, line: 59, type: !13)
!119 = !DILocation(line: 59, column: 9, scope: !111)
!120 = !DILocalVariable(name: "arglist", scope: !111, file: !10, line: 60, type: !31)
!121 = !DILocation(line: 60, column: 13, scope: !111)
!122 = !DILocation(line: 61, column: 5, scope: !111)
!123 = !DILocation(line: 62, column: 26, scope: !111)
!124 = !DILocation(line: 62, column: 31, scope: !111)
!125 = !DILocation(line: 62, column: 40, scope: !111)
!126 = !DILocation(line: 62, column: 48, scope: !111)
!127 = !DILocation(line: 62, column: 11, scope: !111)
!128 = !DILocation(line: 62, column: 9, scope: !111)
!129 = !DILocation(line: 63, column: 5, scope: !111)
!130 = !DILocation(line: 64, column: 12, scope: !111)
!131 = !DILocation(line: 64, column: 5, scope: !111)
!132 = distinct !DISubprogram(name: "cwe120_c_216", scope: !10, file: !10, line: 66, type: !57, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!133 = !DILocalVariable(name: "buf", arg: 1, scope: !132, file: !10, line: 66, type: !14)
!134 = !DILocation(line: 66, column: 25, scope: !132)
!135 = !DILocalVariable(name: "bufSize", arg: 2, scope: !132, file: !10, line: 66, type: !16)
!136 = !DILocation(line: 66, column: 37, scope: !132)
!137 = !DILocalVariable(name: "msg", arg: 3, scope: !132, file: !10, line: 66, type: !14)
!138 = !DILocation(line: 66, column: 52, scope: !132)
!139 = !DILocalVariable(name: "len", scope: !132, file: !10, line: 68, type: !16)
!140 = !DILocation(line: 68, column: 12, scope: !132)
!141 = !DILocation(line: 68, column: 25, scope: !132)
!142 = !DILocation(line: 68, column: 18, scope: !132)
!143 = !DILocation(line: 70, column: 20, scope: !132)
!144 = !DILocation(line: 70, column: 25, scope: !132)
!145 = !DILocation(line: 70, column: 36, scope: !132)
!146 = !DILocation(line: 70, column: 5, scope: !132)
!147 = !DILocation(line: 71, column: 1, scope: !132)
!148 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 72, type: !149, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!149 = !DISubroutineType(types: !150)
!150 = !{!13, !13, !151}
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!152 = !DILocalVariable(name: "argc", arg: 1, scope: !148, file: !10, line: 72, type: !13)
!153 = !DILocation(line: 72, column: 14, scope: !148)
!154 = !DILocalVariable(name: "argv", arg: 2, scope: !148, file: !10, line: 72, type: !151)
!155 = !DILocation(line: 72, column: 27, scope: !148)
!156 = !DILocalVariable(name: "buf", scope: !148, file: !10, line: 74, type: !157)
!157 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, elements: !158)
!158 = !{!159}
!159 = !DISubrange(count: 16)
!160 = !DILocation(line: 74, column: 10, scope: !148)
!161 = !DILocation(line: 75, column: 9, scope: !162)
!162 = distinct !DILexicalBlock(scope: !148, file: !10, line: 75, column: 9)
!163 = !DILocation(line: 75, column: 14, scope: !162)
!164 = !DILocation(line: 75, column: 9, scope: !148)
!165 = !DILocation(line: 76, column: 22, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !10, line: 75, column: 19)
!167 = !DILocation(line: 76, column: 40, scope: !166)
!168 = !DILocation(line: 76, column: 9, scope: !166)
!169 = !DILocation(line: 77, column: 22, scope: !166)
!170 = !DILocation(line: 77, column: 40, scope: !166)
!171 = !DILocation(line: 77, column: 9, scope: !166)
!172 = !DILocation(line: 78, column: 22, scope: !166)
!173 = !DILocation(line: 78, column: 40, scope: !166)
!174 = !DILocation(line: 78, column: 9, scope: !166)
!175 = !DILocation(line: 79, column: 5, scope: !166)
!176 = !DILocation(line: 80, column: 5, scope: !148)
