; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_08_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %call = call i32 @staticReturnsTrue(), !dbg !34
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_08_bad.source to i8*), i64 44, i1 false), !dbg !45
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

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_08_good() #0 !dbg !50 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_08_good(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_08_bad(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !74 {
entry:
  ret i32 1, !dbg !77
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i32 @staticReturnsFalse(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !91
  store i32* %arraydecay, i32** %data, align 8, !dbg !93
  %0 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !98
  %2 = load i32*, i32** %data, align 8, !dbg !99
  %3 = bitcast i32* %2 to i8*, !dbg !99
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !99
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !99
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !99
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !99
  %add = add i64 %call3, 1, !dbg !99
  %mul = mul i64 %add, 4, !dbg !99
  %5 = load i32*, i32** %data, align 8, !dbg !99
  %6 = bitcast i32* %5 to i8*, !dbg !99
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !99
  %call4 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !99
  %8 = load i32*, i32** %data, align 8, !dbg !100
  call void @printWLine(i32* noundef %8), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !103 {
entry:
  ret i32 0, !dbg !104
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %call = call i32 @staticReturnsTrue(), !dbg !112
  %tobool = icmp ne i32 %call, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !115
  store i32* %arraydecay, i32** %data, align 8, !dbg !117
  %0 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  br label %if.end, !dbg !120

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !123
  %2 = load i32*, i32** %data, align 8, !dbg !124
  %3 = bitcast i32* %2 to i8*, !dbg !124
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !124
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !124
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !124
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !124
  %add = add i64 %call3, 1, !dbg !124
  %mul = mul i64 %add, 4, !dbg !124
  %5 = load i32*, i32** %data, align 8, !dbg !124
  %6 = bitcast i32* %5 to i8*, !dbg !124
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !124
  %call4 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !124
  %8 = load i32*, i32** %data, align 8, !dbg !125
  call void @printWLine(i32* noundef %8), !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_08_bad", scope: !12, file: !12, line: 42, type: !13, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 44, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 44, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 45, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 45, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 46, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 352, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 46, column: 13, scope: !11)
!34 = !DILocation(line: 47, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 47, column: 8)
!36 = !DILocation(line: 47, column: 8, scope: !11)
!37 = !DILocation(line: 51, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !12, line: 48, column: 5)
!39 = !DILocation(line: 51, column: 14, scope: !38)
!40 = !DILocation(line: 52, column: 9, scope: !38)
!41 = !DILocation(line: 52, column: 17, scope: !38)
!42 = !DILocation(line: 53, column: 5, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 55, type: !30)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 54, column: 5)
!45 = !DILocation(line: 55, column: 17, scope: !44)
!46 = !DILocation(line: 58, column: 9, scope: !44)
!47 = !DILocation(line: 59, column: 20, scope: !44)
!48 = !DILocation(line: 59, column: 9, scope: !44)
!49 = !DILocation(line: 61, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_08_good", scope: !12, file: !12, line: 116, type: !13, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!51 = !DILocation(line: 118, column: 5, scope: !50)
!52 = !DILocation(line: 119, column: 5, scope: !50)
!53 = !DILocation(line: 120, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 132, type: !55, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!55 = !DISubroutineType(types: !56)
!56 = !{!22, !22, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 132, type: !22)
!61 = !DILocation(line: 132, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 132, type: !57)
!63 = !DILocation(line: 132, column: 27, scope: !54)
!64 = !DILocation(line: 135, column: 22, scope: !54)
!65 = !DILocation(line: 135, column: 12, scope: !54)
!66 = !DILocation(line: 135, column: 5, scope: !54)
!67 = !DILocation(line: 137, column: 5, scope: !54)
!68 = !DILocation(line: 138, column: 5, scope: !54)
!69 = !DILocation(line: 139, column: 5, scope: !54)
!70 = !DILocation(line: 142, column: 5, scope: !54)
!71 = !DILocation(line: 143, column: 5, scope: !54)
!72 = !DILocation(line: 144, column: 5, scope: !54)
!73 = !DILocation(line: 146, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 30, type: !75, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!75 = !DISubroutineType(types: !76)
!76 = !{!22}
!77 = !DILocation(line: 32, column: 5, scope: !74)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 70, type: !17)
!80 = !DILocation(line: 70, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !12, line: 71, type: !25)
!82 = !DILocation(line: 71, column: 13, scope: !78)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !12, line: 72, type: !30)
!84 = !DILocation(line: 72, column: 13, scope: !78)
!85 = !DILocation(line: 73, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !12, line: 73, column: 8)
!87 = !DILocation(line: 73, column: 8, scope: !78)
!88 = !DILocation(line: 76, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !12, line: 74, column: 5)
!90 = !DILocation(line: 77, column: 5, scope: !89)
!91 = !DILocation(line: 82, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !12, line: 79, column: 5)
!93 = !DILocation(line: 82, column: 14, scope: !92)
!94 = !DILocation(line: 83, column: 9, scope: !92)
!95 = !DILocation(line: 83, column: 17, scope: !92)
!96 = !DILocalVariable(name: "source", scope: !97, file: !12, line: 86, type: !30)
!97 = distinct !DILexicalBlock(scope: !78, file: !12, line: 85, column: 5)
!98 = !DILocation(line: 86, column: 17, scope: !97)
!99 = !DILocation(line: 89, column: 9, scope: !97)
!100 = !DILocation(line: 90, column: 20, scope: !97)
!101 = !DILocation(line: 90, column: 9, scope: !97)
!102 = !DILocation(line: 92, column: 1, scope: !78)
!103 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 35, type: !75, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!104 = !DILocation(line: 37, column: 5, scope: !103)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 95, type: !13, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 97, type: !17)
!107 = !DILocation(line: 97, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !12, line: 98, type: !25)
!109 = !DILocation(line: 98, column: 13, scope: !105)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !12, line: 99, type: !30)
!111 = !DILocation(line: 99, column: 13, scope: !105)
!112 = !DILocation(line: 100, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !12, line: 100, column: 8)
!114 = !DILocation(line: 100, column: 8, scope: !105)
!115 = !DILocation(line: 104, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 101, column: 5)
!117 = !DILocation(line: 104, column: 14, scope: !116)
!118 = !DILocation(line: 105, column: 9, scope: !116)
!119 = !DILocation(line: 105, column: 17, scope: !116)
!120 = !DILocation(line: 106, column: 5, scope: !116)
!121 = !DILocalVariable(name: "source", scope: !122, file: !12, line: 108, type: !30)
!122 = distinct !DILexicalBlock(scope: !105, file: !12, line: 107, column: 5)
!123 = !DILocation(line: 108, column: 17, scope: !122)
!124 = !DILocation(line: 111, column: 9, scope: !122)
!125 = !DILocation(line: 112, column: 20, scope: !122)
!126 = !DILocation(line: 112, column: 9, scope: !122)
!127 = !DILocation(line: 114, column: 1, scope: !105)
