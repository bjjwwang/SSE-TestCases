; ModuleID = 'linux_bc/pass/INTERVAL_test_57.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_57.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @a(i32 %x) #0 !dbg !9 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !14, metadata !DIExpression()), !dbg !15
  %0 = load i32, i32* %x.addr, align 4, !dbg !16
  %call = call i32 @b(i32 %0), !dbg !17
  %mul = mul nsw i32 %call, 2, !dbg !18
  ret i32 %mul, !dbg !19
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @b(i32 %x) #0 !dbg !20 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = load i32, i32* %x.addr, align 4, !dbg !23
  %call = call i32 @c(i32 %0), !dbg !24
  %mul = mul nsw i32 %call, 2, !dbg !25
  ret i32 %mul, !dbg !26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @c(i32 %x) #0 !dbg !27 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = load i32, i32* %x.addr, align 4, !dbg !30
  %call = call i32 @d(i32 %0), !dbg !31
  %mul = mul nsw i32 %call, 2, !dbg !32
  ret i32 %mul, !dbg !33
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @d(i32 %x) #0 !dbg !34 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !35, metadata !DIExpression()), !dbg !36
  %0 = load i32, i32* %x.addr, align 4, !dbg !37
  %call = call i32 @e(i32 %0), !dbg !38
  %mul = mul nsw i32 %call, 2, !dbg !39
  ret i32 %mul, !dbg !40
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @e(i32 %x) #0 !dbg !41 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32, i32* %x.addr, align 4, !dbg !44
  %call = call i32 @f(i32 %0), !dbg !45
  %mul = mul nsw i32 %call, 2, !dbg !46
  ret i32 %mul, !dbg !47
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @f(i32 %x) #0 !dbg !48 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %0 = load i32, i32* %x.addr, align 4, !dbg !51
  %call = call i32 @g(i32 %0), !dbg !52
  %mul = mul nsw i32 %call, 2, !dbg !53
  ret i32 %mul, !dbg !54
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @g(i32 %x) #0 !dbg !55 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i32, i32* %x.addr, align 4, !dbg !58
  %call = call i32 @h(i32 %0), !dbg !59
  %mul = mul nsw i32 %call, 2, !dbg !60
  ret i32 %mul, !dbg !61
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @h(i32 %x) #0 !dbg !62 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i32, i32* %x.addr, align 4, !dbg !65
  %call = call i32 @z(i32 %0), !dbg !66
  %mul = mul nsw i32 %call, 2, !dbg !67
  ret i32 %mul, !dbg !68
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @z(i32 %x) #0 !dbg !69 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = load i32, i32* %x.addr, align 4, !dbg !72
  %mul = mul nsw i32 %0, 2, !dbg !73
  ret i32 %mul, !dbg !74
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !75 {
entry:
  %input = alloca i32, align 4
  %result = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %input, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32* %result, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = load i32, i32* %input, align 4, !dbg !82
  %call = call i32 @a(i32 %0), !dbg !83
  store i32 %call, i32* %result, align 4, !dbg !81
  %1 = load i32, i32* %result, align 4, !dbg !84
  %2 = load i32, i32* %input, align 4, !dbg !85
  %mul = mul nsw i32 %2, 512, !dbg !86
  %cmp = icmp eq i32 %1, %mul, !dbg !87
  call void @svf_assert(i1 zeroext %cmp), !dbg !88
  ret i32 0, !dbg !89
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_57.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "a", scope: !10, file: !10, line: 18, type: !11, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_57.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "x", arg: 1, scope: !9, file: !10, line: 18, type: !13)
!15 = !DILocation(line: 18, column: 11, scope: !9)
!16 = !DILocation(line: 19, column: 11, scope: !9)
!17 = !DILocation(line: 19, column: 9, scope: !9)
!18 = !DILocation(line: 19, column: 14, scope: !9)
!19 = !DILocation(line: 19, column: 2, scope: !9)
!20 = distinct !DISubprogram(name: "b", scope: !10, file: !10, line: 22, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocalVariable(name: "x", arg: 1, scope: !20, file: !10, line: 22, type: !13)
!22 = !DILocation(line: 22, column: 11, scope: !20)
!23 = !DILocation(line: 23, column: 11, scope: !20)
!24 = !DILocation(line: 23, column: 9, scope: !20)
!25 = !DILocation(line: 23, column: 14, scope: !20)
!26 = !DILocation(line: 23, column: 2, scope: !20)
!27 = distinct !DISubprogram(name: "c", scope: !10, file: !10, line: 26, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DILocalVariable(name: "x", arg: 1, scope: !27, file: !10, line: 26, type: !13)
!29 = !DILocation(line: 26, column: 11, scope: !27)
!30 = !DILocation(line: 27, column: 11, scope: !27)
!31 = !DILocation(line: 27, column: 9, scope: !27)
!32 = !DILocation(line: 27, column: 14, scope: !27)
!33 = !DILocation(line: 27, column: 2, scope: !27)
!34 = distinct !DISubprogram(name: "d", scope: !10, file: !10, line: 30, type: !11, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocalVariable(name: "x", arg: 1, scope: !34, file: !10, line: 30, type: !13)
!36 = !DILocation(line: 30, column: 11, scope: !34)
!37 = !DILocation(line: 31, column: 11, scope: !34)
!38 = !DILocation(line: 31, column: 9, scope: !34)
!39 = !DILocation(line: 31, column: 14, scope: !34)
!40 = !DILocation(line: 31, column: 2, scope: !34)
!41 = distinct !DISubprogram(name: "e", scope: !10, file: !10, line: 34, type: !11, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "x", arg: 1, scope: !41, file: !10, line: 34, type: !13)
!43 = !DILocation(line: 34, column: 11, scope: !41)
!44 = !DILocation(line: 35, column: 11, scope: !41)
!45 = !DILocation(line: 35, column: 9, scope: !41)
!46 = !DILocation(line: 35, column: 14, scope: !41)
!47 = !DILocation(line: 35, column: 2, scope: !41)
!48 = distinct !DISubprogram(name: "f", scope: !10, file: !10, line: 38, type: !11, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocalVariable(name: "x", arg: 1, scope: !48, file: !10, line: 38, type: !13)
!50 = !DILocation(line: 38, column: 11, scope: !48)
!51 = !DILocation(line: 39, column: 11, scope: !48)
!52 = !DILocation(line: 39, column: 9, scope: !48)
!53 = !DILocation(line: 39, column: 14, scope: !48)
!54 = !DILocation(line: 39, column: 2, scope: !48)
!55 = distinct !DISubprogram(name: "g", scope: !10, file: !10, line: 42, type: !11, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocalVariable(name: "x", arg: 1, scope: !55, file: !10, line: 42, type: !13)
!57 = !DILocation(line: 42, column: 11, scope: !55)
!58 = !DILocation(line: 43, column: 11, scope: !55)
!59 = !DILocation(line: 43, column: 9, scope: !55)
!60 = !DILocation(line: 43, column: 14, scope: !55)
!61 = !DILocation(line: 43, column: 2, scope: !55)
!62 = distinct !DISubprogram(name: "h", scope: !10, file: !10, line: 46, type: !11, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "x", arg: 1, scope: !62, file: !10, line: 46, type: !13)
!64 = !DILocation(line: 46, column: 11, scope: !62)
!65 = !DILocation(line: 47, column: 11, scope: !62)
!66 = !DILocation(line: 47, column: 9, scope: !62)
!67 = !DILocation(line: 47, column: 14, scope: !62)
!68 = !DILocation(line: 47, column: 2, scope: !62)
!69 = distinct !DISubprogram(name: "z", scope: !10, file: !10, line: 50, type: !11, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "x", arg: 1, scope: !69, file: !10, line: 50, type: !13)
!71 = !DILocation(line: 50, column: 11, scope: !69)
!72 = !DILocation(line: 51, column: 9, scope: !69)
!73 = !DILocation(line: 51, column: 11, scope: !69)
!74 = !DILocation(line: 51, column: 2, scope: !69)
!75 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 54, type: !76, scopeLine: 54, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!13}
!78 = !DILocalVariable(name: "input", scope: !75, file: !10, line: 55, type: !13)
!79 = !DILocation(line: 55, column: 6, scope: !75)
!80 = !DILocalVariable(name: "result", scope: !75, file: !10, line: 56, type: !13)
!81 = !DILocation(line: 56, column: 6, scope: !75)
!82 = !DILocation(line: 56, column: 17, scope: !75)
!83 = !DILocation(line: 56, column: 15, scope: !75)
!84 = !DILocation(line: 57, column: 13, scope: !75)
!85 = !DILocation(line: 57, column: 23, scope: !75)
!86 = !DILocation(line: 57, column: 29, scope: !75)
!87 = !DILocation(line: 57, column: 20, scope: !75)
!88 = !DILocation(line: 57, column: 2, scope: !75)
!89 = !DILocation(line: 58, column: 1, scope: !75)
