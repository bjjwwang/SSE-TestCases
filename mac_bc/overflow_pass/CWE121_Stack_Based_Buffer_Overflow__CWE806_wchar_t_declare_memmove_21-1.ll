; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_21-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_21-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !7
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !11

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_21_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  store i32 1, i32* @badStatic, align 4, !dbg !38
  %0 = load i32*, i32** %data, align 8, !dbg !39
  %call = call i32* @badSource(i32* noundef %0), !dbg !40
  store i32* %call, i32** %data, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !47
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !48
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !48
  %3 = load i32*, i32** %data, align 8, !dbg !48
  %4 = bitcast i32* %3 to i8*, !dbg !48
  %5 = load i32*, i32** %data, align 8, !dbg !48
  %call2 = call i64 @wcslen(i32* noundef %5), !dbg !48
  %mul = mul i64 %call2, 4, !dbg !48
  %call3 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %4, i64 noundef %mul, i64 noundef 200) #5, !dbg !48
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !49
  store i32 0, i32* %arrayidx, align 4, !dbg !50
  %6 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* noundef %6), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @badSource(i32* noundef %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* @badStatic, align 4, !dbg !59
  %tobool = icmp ne i32 %0, 0, !dbg !59
  br i1 %tobool, label %if.then, label %if.end, !dbg !61

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !62
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 99), !dbg !64
  %2 = load i32*, i32** %data.addr, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !65
  store i32 0, i32* %arrayidx, align 4, !dbg !66
  br label %if.end, !dbg !67

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !68
  ret i32* %3, !dbg !69
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #4

declare void @printWLine(i32* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_21_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* noundef null), !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 noundef %conv), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_21_good(), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_21_bad(), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !99
  store i32* %arraydecay, i32** %data, align 8, !dbg !100
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !101
  %0 = load i32*, i32** %data, align 8, !dbg !102
  %call = call i32* @goodG2B1Source(i32* noundef %0), !dbg !103
  store i32* %call, i32** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !107
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !108
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !108
  %3 = load i32*, i32** %data, align 8, !dbg !108
  %4 = bitcast i32* %3 to i8*, !dbg !108
  %5 = load i32*, i32** %data, align 8, !dbg !108
  %call2 = call i64 @wcslen(i32* noundef %5), !dbg !108
  %mul = mul i64 %call2, 4, !dbg !108
  %call3 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %4, i64 noundef %mul, i64 noundef 200) #5, !dbg !108
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  %6 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* noundef %6), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @goodG2B1Source(i32* noundef %data) #0 !dbg !114 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !117
  %tobool = icmp ne i32 %0, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.else, !dbg !119

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !120
  br label %if.end, !dbg !122

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !123
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 49), !dbg !125
  %2 = load i32*, i32** %data.addr, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !128
  ret i32* %3, !dbg !129
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !130 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !135
  store i32* %arraydecay, i32** %data, align 8, !dbg !136
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !137
  %0 = load i32*, i32** %data, align 8, !dbg !138
  %call = call i32* @goodG2B2Source(i32* noundef %0), !dbg !139
  store i32* %call, i32** %data, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !141, metadata !DIExpression()), !dbg !143
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !143
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !144
  %2 = bitcast i32* %arraydecay1 to i8*, !dbg !144
  %3 = load i32*, i32** %data, align 8, !dbg !144
  %4 = bitcast i32* %3 to i8*, !dbg !144
  %5 = load i32*, i32** %data, align 8, !dbg !144
  %call2 = call i64 @wcslen(i32* noundef %5), !dbg !144
  %mul = mul i64 %call2, 4, !dbg !144
  %call3 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %4, i64 noundef %mul, i64 noundef 200) #5, !dbg !144
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !145
  store i32 0, i32* %arrayidx, align 4, !dbg !146
  %6 = load i32*, i32** %data, align 8, !dbg !147
  call void @printWLine(i32* noundef %6), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @goodG2B2Source(i32* noundef %data) #0 !dbg !150 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !151, metadata !DIExpression()), !dbg !152
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !153
  %tobool = icmp ne i32 %0, 0, !dbg !153
  br i1 %tobool, label %if.then, label %if.end, !dbg !155

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !156
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 49), !dbg !158
  %2 = load i32*, i32** %data.addr, align 8, !dbg !159
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !159
  store i32 0, i32* %arrayidx, align 4, !dbg !160
  br label %if.end, !dbg !161

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !162
  ret i32* %3, !dbg !163
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !9, line: 24, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7, !11}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !9, line: 58, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !9, line: 59, type: !10, isLocal: true, isDefinition: true)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_21_bad", scope: !9, file: !9, line: 37, type: !21, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !9, line: 39, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !27, line: 34, baseType: !28)
!27 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !29, line: 106, baseType: !10)
!29 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!30 = !DILocation(line: 39, column: 15, scope: !20)
!31 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !9, line: 40, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 40, column: 13, scope: !20)
!36 = !DILocation(line: 41, column: 12, scope: !20)
!37 = !DILocation(line: 41, column: 10, scope: !20)
!38 = !DILocation(line: 42, column: 15, scope: !20)
!39 = !DILocation(line: 43, column: 22, scope: !20)
!40 = !DILocation(line: 43, column: 12, scope: !20)
!41 = !DILocation(line: 43, column: 10, scope: !20)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !9, line: 45, type: !44)
!43 = distinct !DILexicalBlock(scope: !20, file: !9, line: 44, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 45, column: 17, scope: !43)
!48 = !DILocation(line: 47, column: 9, scope: !43)
!49 = !DILocation(line: 48, column: 9, scope: !43)
!50 = !DILocation(line: 48, column: 20, scope: !43)
!51 = !DILocation(line: 49, column: 20, scope: !43)
!52 = !DILocation(line: 49, column: 9, scope: !43)
!53 = !DILocation(line: 51, column: 1, scope: !20)
!54 = distinct !DISubprogram(name: "badSource", scope: !9, file: !9, line: 26, type: !55, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!55 = !DISubroutineType(types: !56)
!56 = !{!25, !25}
!57 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !9, line: 26, type: !25)
!58 = !DILocation(line: 26, column: 38, scope: !54)
!59 = !DILocation(line: 28, column: 8, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !9, line: 28, column: 8)
!61 = !DILocation(line: 28, column: 8, scope: !54)
!62 = !DILocation(line: 31, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !9, line: 29, column: 5)
!64 = !DILocation(line: 31, column: 9, scope: !63)
!65 = !DILocation(line: 32, column: 9, scope: !63)
!66 = !DILocation(line: 32, column: 21, scope: !63)
!67 = !DILocation(line: 33, column: 5, scope: !63)
!68 = !DILocation(line: 34, column: 12, scope: !54)
!69 = !DILocation(line: 34, column: 5, scope: !54)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_21_good", scope: !9, file: !9, line: 122, type: !21, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!71 = !DILocation(line: 124, column: 5, scope: !70)
!72 = !DILocation(line: 125, column: 5, scope: !70)
!73 = !DILocation(line: 126, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 138, type: !75, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!75 = !DISubroutineType(types: !76)
!76 = !{!10, !10, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !9, line: 138, type: !10)
!81 = !DILocation(line: 138, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !9, line: 138, type: !77)
!83 = !DILocation(line: 138, column: 27, scope: !74)
!84 = !DILocation(line: 141, column: 22, scope: !74)
!85 = !DILocation(line: 141, column: 12, scope: !74)
!86 = !DILocation(line: 141, column: 5, scope: !74)
!87 = !DILocation(line: 143, column: 5, scope: !74)
!88 = !DILocation(line: 144, column: 5, scope: !74)
!89 = !DILocation(line: 145, column: 5, scope: !74)
!90 = !DILocation(line: 148, column: 5, scope: !74)
!91 = !DILocation(line: 149, column: 5, scope: !74)
!92 = !DILocation(line: 150, column: 5, scope: !74)
!93 = !DILocation(line: 152, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!95 = !DILocalVariable(name: "data", scope: !94, file: !9, line: 80, type: !25)
!96 = !DILocation(line: 80, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !9, line: 81, type: !32)
!98 = !DILocation(line: 81, column: 13, scope: !94)
!99 = !DILocation(line: 82, column: 12, scope: !94)
!100 = !DILocation(line: 82, column: 10, scope: !94)
!101 = !DILocation(line: 83, column: 20, scope: !94)
!102 = !DILocation(line: 84, column: 27, scope: !94)
!103 = !DILocation(line: 84, column: 12, scope: !94)
!104 = !DILocation(line: 84, column: 10, scope: !94)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !9, line: 86, type: !44)
!106 = distinct !DILexicalBlock(scope: !94, file: !9, line: 85, column: 5)
!107 = !DILocation(line: 86, column: 17, scope: !106)
!108 = !DILocation(line: 88, column: 9, scope: !106)
!109 = !DILocation(line: 89, column: 9, scope: !106)
!110 = !DILocation(line: 89, column: 20, scope: !106)
!111 = !DILocation(line: 90, column: 20, scope: !106)
!112 = !DILocation(line: 90, column: 9, scope: !106)
!113 = !DILocation(line: 92, column: 1, scope: !94)
!114 = distinct !DISubprogram(name: "goodG2B1Source", scope: !9, file: !9, line: 62, type: !55, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!115 = !DILocalVariable(name: "data", arg: 1, scope: !114, file: !9, line: 62, type: !25)
!116 = !DILocation(line: 62, column: 43, scope: !114)
!117 = !DILocation(line: 64, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !9, line: 64, column: 8)
!119 = !DILocation(line: 64, column: 8, scope: !114)
!120 = !DILocation(line: 67, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !9, line: 65, column: 5)
!122 = !DILocation(line: 68, column: 5, scope: !121)
!123 = !DILocation(line: 72, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !118, file: !9, line: 70, column: 5)
!125 = !DILocation(line: 72, column: 9, scope: !124)
!126 = !DILocation(line: 73, column: 9, scope: !124)
!127 = !DILocation(line: 73, column: 20, scope: !124)
!128 = !DILocation(line: 75, column: 12, scope: !114)
!129 = !DILocation(line: 75, column: 5, scope: !114)
!130 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 106, type: !21, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!131 = !DILocalVariable(name: "data", scope: !130, file: !9, line: 108, type: !25)
!132 = !DILocation(line: 108, column: 15, scope: !130)
!133 = !DILocalVariable(name: "dataBuffer", scope: !130, file: !9, line: 109, type: !32)
!134 = !DILocation(line: 109, column: 13, scope: !130)
!135 = !DILocation(line: 110, column: 12, scope: !130)
!136 = !DILocation(line: 110, column: 10, scope: !130)
!137 = !DILocation(line: 111, column: 20, scope: !130)
!138 = !DILocation(line: 112, column: 27, scope: !130)
!139 = !DILocation(line: 112, column: 12, scope: !130)
!140 = !DILocation(line: 112, column: 10, scope: !130)
!141 = !DILocalVariable(name: "dest", scope: !142, file: !9, line: 114, type: !44)
!142 = distinct !DILexicalBlock(scope: !130, file: !9, line: 113, column: 5)
!143 = !DILocation(line: 114, column: 17, scope: !142)
!144 = !DILocation(line: 116, column: 9, scope: !142)
!145 = !DILocation(line: 117, column: 9, scope: !142)
!146 = !DILocation(line: 117, column: 20, scope: !142)
!147 = !DILocation(line: 118, column: 20, scope: !142)
!148 = !DILocation(line: 118, column: 9, scope: !142)
!149 = !DILocation(line: 120, column: 1, scope: !130)
!150 = distinct !DISubprogram(name: "goodG2B2Source", scope: !9, file: !9, line: 95, type: !55, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!151 = !DILocalVariable(name: "data", arg: 1, scope: !150, file: !9, line: 95, type: !25)
!152 = !DILocation(line: 95, column: 43, scope: !150)
!153 = !DILocation(line: 97, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !9, line: 97, column: 8)
!155 = !DILocation(line: 97, column: 8, scope: !150)
!156 = !DILocation(line: 100, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !9, line: 98, column: 5)
!158 = !DILocation(line: 100, column: 9, scope: !157)
!159 = !DILocation(line: 101, column: 9, scope: !157)
!160 = !DILocation(line: 101, column: 20, scope: !157)
!161 = !DILocation(line: 102, column: 5, scope: !157)
!162 = !DILocation(line: 103, column: 12, scope: !150)
!163 = !DILocation(line: 103, column: 5, scope: !150)
