; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_11_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_11_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %call = call i32 (...) @globalReturnsTrue(), !dbg !34
  %tobool = icmp ne i32 %call, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i32* %arraydecay, i32** %data, align 8, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_11_bad.source to i8*), i64 44, i1 false), !dbg !45
  %2 = load i32*, i32** %data, align 8, !dbg !46
  %3 = bitcast i32* %2 to i8*, !dbg !46
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !46
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !46
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !46
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !46
  %add = add i64 %call3, 1, !dbg !46
  %mul = mul i64 %add, 4, !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !46
  %6 = bitcast i32* %5 to i8*, !dbg !46
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !46
  %call4 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !46
  %8 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* noundef %8), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @wcslen(i32* noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_11_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* noundef null), !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 noundef %conv), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_11_good(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_11_bad(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i32 (...) @globalReturnsFalse(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !87
  store i32* %arraydecay, i32** %data, align 8, !dbg !89
  %0 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !94
  %2 = load i32*, i32** %data, align 8, !dbg !95
  %3 = bitcast i32* %2 to i8*, !dbg !95
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !95
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !95
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !95
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !95
  %add = add i64 %call3, 1, !dbg !95
  %mul = mul i64 %add, 4, !dbg !95
  %5 = load i32*, i32** %data, align 8, !dbg !95
  %6 = bitcast i32* %5 to i8*, !dbg !95
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !95
  %call4 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !95
  %8 = load i32*, i32** %data, align 8, !dbg !96
  call void @printWLine(i32* noundef %8), !dbg !97
  ret void, !dbg !98
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i32 (...) @globalReturnsTrue(), !dbg !106
  %tobool = icmp ne i32 %call, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !109
  store i32* %arraydecay, i32** %data, align 8, !dbg !111
  %0 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  br label %if.end, !dbg !114

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !117
  %2 = load i32*, i32** %data, align 8, !dbg !118
  %3 = bitcast i32* %2 to i8*, !dbg !118
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !118
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !118
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !118
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !118
  %add = add i64 %call3, 1, !dbg !118
  %mul = mul i64 %add, 4, !dbg !118
  %5 = load i32*, i32** %data, align 8, !dbg !118
  %6 = bitcast i32* %5 to i8*, !dbg !118
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !118
  %call4 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !118
  %8 = load i32*, i32** %data, align 8, !dbg !119
  call void @printWLine(i32* noundef %8), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_11_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 30, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 31, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 352, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 32, column: 13, scope: !11)
!34 = !DILocation(line: 33, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!36 = !DILocation(line: 33, column: 8, scope: !11)
!37 = !DILocation(line: 37, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !12, line: 34, column: 5)
!39 = !DILocation(line: 37, column: 14, scope: !38)
!40 = !DILocation(line: 38, column: 9, scope: !38)
!41 = !DILocation(line: 38, column: 17, scope: !38)
!42 = !DILocation(line: 39, column: 5, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 41, type: !30)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!45 = !DILocation(line: 41, column: 17, scope: !44)
!46 = !DILocation(line: 44, column: 9, scope: !44)
!47 = !DILocation(line: 45, column: 20, scope: !44)
!48 = !DILocation(line: 45, column: 9, scope: !44)
!49 = !DILocation(line: 47, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_11_good", scope: !12, file: !12, line: 102, type: !13, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!51 = !DILocation(line: 104, column: 5, scope: !50)
!52 = !DILocation(line: 105, column: 5, scope: !50)
!53 = !DILocation(line: 106, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 118, type: !55, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!55 = !DISubroutineType(types: !56)
!56 = !{!22, !22, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 118, type: !22)
!61 = !DILocation(line: 118, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 118, type: !57)
!63 = !DILocation(line: 118, column: 27, scope: !54)
!64 = !DILocation(line: 121, column: 22, scope: !54)
!65 = !DILocation(line: 121, column: 12, scope: !54)
!66 = !DILocation(line: 121, column: 5, scope: !54)
!67 = !DILocation(line: 123, column: 5, scope: !54)
!68 = !DILocation(line: 124, column: 5, scope: !54)
!69 = !DILocation(line: 125, column: 5, scope: !54)
!70 = !DILocation(line: 128, column: 5, scope: !54)
!71 = !DILocation(line: 129, column: 5, scope: !54)
!72 = !DILocation(line: 130, column: 5, scope: !54)
!73 = !DILocation(line: 132, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 56, type: !17)
!76 = !DILocation(line: 56, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !12, line: 57, type: !25)
!78 = !DILocation(line: 57, column: 13, scope: !74)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !12, line: 58, type: !30)
!80 = !DILocation(line: 58, column: 13, scope: !74)
!81 = !DILocation(line: 59, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !12, line: 59, column: 8)
!83 = !DILocation(line: 59, column: 8, scope: !74)
!84 = !DILocation(line: 62, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 60, column: 5)
!86 = !DILocation(line: 63, column: 5, scope: !85)
!87 = !DILocation(line: 68, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !12, line: 65, column: 5)
!89 = !DILocation(line: 68, column: 14, scope: !88)
!90 = !DILocation(line: 69, column: 9, scope: !88)
!91 = !DILocation(line: 69, column: 17, scope: !88)
!92 = !DILocalVariable(name: "source", scope: !93, file: !12, line: 72, type: !30)
!93 = distinct !DILexicalBlock(scope: !74, file: !12, line: 71, column: 5)
!94 = !DILocation(line: 72, column: 17, scope: !93)
!95 = !DILocation(line: 75, column: 9, scope: !93)
!96 = !DILocation(line: 76, column: 20, scope: !93)
!97 = !DILocation(line: 76, column: 9, scope: !93)
!98 = !DILocation(line: 78, column: 1, scope: !74)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 83, type: !17)
!101 = !DILocation(line: 83, column: 15, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !12, line: 84, type: !25)
!103 = !DILocation(line: 84, column: 13, scope: !99)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !12, line: 85, type: !30)
!105 = !DILocation(line: 85, column: 13, scope: !99)
!106 = !DILocation(line: 86, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !99, file: !12, line: 86, column: 8)
!108 = !DILocation(line: 86, column: 8, scope: !99)
!109 = !DILocation(line: 90, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !12, line: 87, column: 5)
!111 = !DILocation(line: 90, column: 14, scope: !110)
!112 = !DILocation(line: 91, column: 9, scope: !110)
!113 = !DILocation(line: 91, column: 17, scope: !110)
!114 = !DILocation(line: 92, column: 5, scope: !110)
!115 = !DILocalVariable(name: "source", scope: !116, file: !12, line: 94, type: !30)
!116 = distinct !DILexicalBlock(scope: !99, file: !12, line: 93, column: 5)
!117 = !DILocation(line: 94, column: 17, scope: !116)
!118 = !DILocation(line: 97, column: 9, scope: !116)
!119 = !DILocation(line: 98, column: 20, scope: !116)
!120 = !DILocation(line: 98, column: 9, scope: !116)
!121 = !DILocation(line: 100, column: 1, scope: !99)
